#coding : utf-8
class Post < ActiveRecord::Base
  attr_accessible :content, :name, :published_at, :situation, :author_id, :category_id

  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'

  with_options :presence => {:message => 'Campo Obrigatório'} do |v| #já sabe que tem que ser :presence => true
    v.validates :name, :uniqueness => { :message => 'Já existe um post com esse título' }
    v.validates :content
    v.validates :published_at
    v.validates :author_id
    v.validates :category_id
  end

end