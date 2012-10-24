class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :chamado
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  attr_accessible :descricao, :user_id, :name
end
