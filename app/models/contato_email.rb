class ContatoEmail < ActiveRecord::Base
  belongs_to :cliente
  attr_accessible :contato, :email
end
