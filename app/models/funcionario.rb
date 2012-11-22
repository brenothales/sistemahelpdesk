class Funcionario < ActiveRecord::Base
  belongs_to :user
  has_many :chamados, :dependent => :destroy
  has_many :contato_telefones, :dependent => :destroy
  accepts_nested_attributes_for :contato_telefones, :reject_if => proc{|a| a["numero"].blank? }
  attr_accessible :ctps, :funcao, :user_id, :contato_telefones_attributes, :cpf, :rg, :sexo, :dataNascimento, :name


 validates_presence_of :name
validates_associated :attribute, :on => :create

  def telefones
    self.contato_telefones.map{|a| "(#{a.ddd}) #{a.numero}"}
  end
  
  def telefone
    tels = telefones
    tels.length > 0 ? tels.first : "-" 
  end
end
