class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :chamado
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  attr_accessible :descricao, :user_id, :name, :finalizarChamado

  validates_presence_of :descricao, :message => "can't be blank"

   # with_options :presence => {:message => 'Campo Obrigatório'} do |v| #já sabe que tem que ser :presence => true
   #  v.validates :name, :uniqueness => { :message => 'Já existe um post com esse título' }
   #  v.validates :content
   #  v.validates :published_at
   #  v.validates :author_id
   #  v.validates :category_id
end
