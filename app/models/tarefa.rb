class Tarefa < ActiveRecord::Base
  belongs_to :servico
  attr_accessible :completado, :cortesia, :descricao, :nome, :observacao, :valor_tarefa, :servico_id
end
