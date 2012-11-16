# encoding: UTF-8  
class Chamado < ActiveRecord::Base
  belongs_to :user
  belongs_to :setor
  belongs_to :funcionario
  belongs_to :cliente
  belongs_to :funcionario
  has_many :comments, :dependent => :destroy
  attr_accessible :assunto, :cortesia, :descricao, :finalizaSolicitacao, 
  				  :observacao, :prioridade, :solucionado, 
  				  :tipoAtendimento, :valorGeral, :produto_id, :user_id, :produto, :status,
             :servicos_attributes, :cancelar, :setor_id, :cliente_id, :funcionario_id, :querofinalizar
validates_presence_of  :assunto, :descricao, :prioridade, :tipoAtendimento, :slug, :setor_id

has_many :servicos, :dependent => :destroy
  accepts_nested_attributes_for :servicos, allow_destroy: true

# TIPODEATENDIMENTO = %w(1,2,3,4".split(",").map { |s| s.to_i })
TIPODEATENDIMENTO = %w(Online Balcão Domiciliar Visita-cliente)
PRIORIDADE = %w(Normal Urgente Extraurgente)
# STATUS = %w(0 10 20 30 40 50 60 70 80 90 100)
STATUS = %w("Aguardando Atendimento", "Aguardando Peça", "Aguardando Aprovação Orçamento",  "Aprovação", "Finalização", "Listagens")

validates_numericality_of :valorGeral, :greater_than => -1, :allow_nil => true

def identificacao_chamado
  " N #{id} - #{assunto} - #{user.name}"
end


before_validation :generate_slug


# def to_param
#   "#{id}-#{slug}"
# end

# def #  produto.name if produto
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
protected

  def generate_slug
    self.slug = assunto unless slug.present?
    self.slug = slug.parameterize
  end
end
