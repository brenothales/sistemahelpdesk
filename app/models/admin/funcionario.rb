class Admin::Funcionario < ActiveRecord::Base
  belongs_to :user
  attr_accessible :ctps, :funcao, :user_id
end
