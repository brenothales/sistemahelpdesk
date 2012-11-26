class Statu < ActiveRecord::Base
  attr_accessible :nome

  validates_presence_of :nome
  has_many :servicos
end
