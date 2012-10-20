class Chamado < ActiveRecord::Base
  belongs_to :user
  belongs_to :produto
  attr_accessible :assunto, :cortesia, :descricao, :finalizaSolicitacao, 
  				  :observacao, :prioridade, :solucionado, 
  				  :tipoAtendimento, :valorGeral, :produto_id, :user_id, :produto_name, :name
validates_presence_of :produto_name
accepts_nested_attributes_for :produto
TIPODEATENDIMENTO = %w(Online Balcao Domiciliar Visita)
PRIORIDADE = %w(Normal Urgente Extraurgente)

accepts_nested_attributes_for :produto

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
