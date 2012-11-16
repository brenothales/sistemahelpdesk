#coding : utf-8
class User < ActiveRecord::Base

  belongs_to :role
  has_many :chamados
  has_many :posts, :class_name => 'Post', :foreign_key => 'author_id'
  has_many :produtos
  has_many :chamados, :dependent => :destroy
  has_many :comments, :class_name => 'User', :foreign_key => 'id'
  has_one  :cliente,  :dependent => :destroy
 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role_id, :situation, :cliente
  # attr_accessible :title, :body

  with_options :presence => true do |validation|
    validation.with_options :uniqueness => true do |validation|
      validation.validates :name
      validation.validates :email
    end
    validation.validates :password
    validation.validates :role_id
  end
  validates_confirmation_of :password

  
  def self.search(search)
    unless search.nil? || search.empty?
      where('name LIKE ?',"%#{search}%").order("#{$order_by} #{$ordem}")
    else
      order("#{$order_by} #{$ordem}")
    end
  end

  def is_role?(role)
    self.role.name.to_sym.eql?(role)
  end

  def get_cliente
    @cliente = Cliente.find_by_user_id(self.id)
  end

  def is_cliente
    self.get_cliente() != nil
  end

  def get_funcionario
    @funcionario = Funcionario.find_by_user_id(self.id)
  end

  def is_funcionario
    self.get_funcionario() != nil
  end
end

