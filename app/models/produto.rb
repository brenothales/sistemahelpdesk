class Produto < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :chamados

  attr_accessible :acessorios, :marca, :modelo, :name, :nome,
  :numeroContrato, :numeroSerie, :observacao, :patrimonio, :seto, 
  :valorDespreciaco, :situation, :category_id, :valorDespreciacao, :user_id, 
  :produto_name, :produto, :produto_id

 # validates_presence_of :acessorios, :marca, :modelo, 
 #                        :name, :numeroContrato, :numeroSerie, 
 #                        :observacao, :patrimonio, :seto, :category_name,
 #                        :valorDespreciacao, :category_id
                      
 # validates_numericality_of :valorDespreciacao, :numeroContrato, :greater_than => 0, :allow_nil => true

  # validates :name,  :presence => true,
  #                   :length => { :minimum => 10 }  
  validates_length_of   :name, :in => 3..50

  scope :actived?, where(:situation => true) 
  scope :last_five, where(:situation => true).limit(5).order('id DESC')

  def self.search(search)
    unless search.nil? || search.empty?
      where('name LIKE ?',"%#{search}%").order("#{$order_by} #{$ordem}")
    else
      order("#{$order_by} #{$ordem}")
    end
  end

  def category_name
    category.try(:name)
  end
 
  def category_name=(name)
    self.category = Category.find_or_create_by_name(name) if name.present?
  end

  


end
