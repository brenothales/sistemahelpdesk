class Peca < ActiveRecord::Base
  attr_accessible :codigo, :nome, :servico_id, :valorPeca, :observacao, :trocarPeca
  belongs_to :servico
end
