class ContatoTelefone < ActiveRecord::Base
  belongs_to :cliente
  attr_accessible :DDD, :fax, :numero, :ramal, :cliente
end
