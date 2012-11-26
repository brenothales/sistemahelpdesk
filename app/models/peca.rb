class Peca < ActiveRecord::Base
  attr_accessible :codigo, :nome, :servico_id, :valorPeca, :observacao, :trocarPeca, :cortesia
  belongs_to :servico
  validates_presence_of :nome, :on => :create, :message => "can't be blank"

end
