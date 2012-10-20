class ChamadoProduto < ActiveRecord::Base
  belongs_to :chamado
  belongs_to :produto
  belongs_to :user
  attr_accessible :observacao
end
