class Endereco < ActiveRecord::Base
  belongs_to :cliente
  attr_accessible :bairro, :cep, :cidade, :uf, :logradouro, :numero
end
