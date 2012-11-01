class Servico < ActiveRecord::Base
  attr_accessible :descricacao, :nome, :chamado_id, :pecas_attributes, :valorServico, :observacao, :completado
  belongs_to :chamado
  has_many :pecas, :dependent => :destroy

  accepts_nested_attributes_for :pecas, allow_destroy: true
  
validates_presence_of :nome, :chamado
  validates_numericality_of :valorServico, :greater_than => 0, :allow_nil => true
end
