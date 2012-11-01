class Chamado < ActiveRecord::Base
  belongs_to :user
  belongs_to :produto
  has_many :comments, :dependent => :destroy
  attr_accessible :assunto, :cortesia, :descricao, :finalizaSolicitacao, 
  				  :observacao, :prioridade, :solucionado, 
  				  :tipoAtendimento, :valorGeral, :produto_id, :user_id, :produto, :status, :servicos_attributes
validates_presence_of :produto, :assunto, :descricao, :prioridade, :tipoAtendimento

has_many :servicos
  accepts_nested_attributes_for :servicos, allow_destroy: true

TIPODEATENDIMENTO = %w(Online Balcao Domiciliar Visita-cliente)
PRIORIDADE = %w(Normal Urgente Extraurgente)
STATUS = %w(0 10 20 30 40 50 60 70 80 90 100)

validates_numericality_of :status, :valorGeral, :greater_than => -1, :allow_nil => true



# def produto_name
 #  produto.name if produto
# end
# 
# def produto_name=(name)
 #  self.produto = Produto.find_or_create_by_name(name) unless name.blank?
# end

  def produto_name
    produto.try(:name)
  end
  
  def produto_name=(name)
    # self.produto = Produto.find_or_create_by_name(name) unless name.blank?
    self.produto = Produto.find_by_name(name) unless name.blank?
  end

end
