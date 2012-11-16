class ContatoTelefone < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :funcionario
  attr_accessible :DDD, :fax, :numero, :ramal, :cliente, :funcionario
end
