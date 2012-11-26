class Produto < ActiveRecord::Base
  belongs_to :category
  belongs_to :setor
  belongs_to :user
  belongs_to :produto, :class_name => "Produto"

 

  attr_accessible :acessorios, :marca, :modelo, :name, :nome,
  :numeroContrato, :numeroSerie, :observacao, :patrimonio, :seto, 
  :valorDespreciaco, :situation, :category_id, :valorDespreciacao, :user_id, 
  :produto_name, :produto_id, :servicos_attributes, :setor_id, :unidade_id, :nome,  :setores_attributes
  # Produto tem muito Serviços e servicos depende da existência de Produto
  has_many :servicos, :dependent => :destroy
  accepts_nested_attributes_for :servicos, allow_destroy: true

  validates_presence_of  :marca, :modelo, :name, :numeroSerie, 
                         :patrimonio, :category_id

                      
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

  def produto_name
    produto.try(:name)
  end
 
  def produto_name=(name)
    self.produto = Produto.find_or_create_by_name(name) if name.present?
  end

  


end
