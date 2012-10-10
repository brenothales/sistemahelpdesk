#coding : utf-8
class Category < ActiveRecord::Base
  
  attr_accessible :name, :situation

  has_many :produtos

  validates_presence_of :name
  validates_length_of   :name, :in => 3..50

  scope :actived?, where(:situation => true) 
  scope :last_five, where(:situation => true).limit(5).order('id DESC')

  def self.search(search)
    unless search.nil? || search.empty?
      where('name LIKE ?',"%#{search}%").order("#{$order_by} #{$ordem}")
    else
      order("#{$order_by} #{$ordem}")
    end
  end

end

