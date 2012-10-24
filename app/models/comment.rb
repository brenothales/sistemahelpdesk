class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :chamado
  attr_accessible :descricao, :user_id, :name
end
