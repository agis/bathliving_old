class Post < ActiveRecord::Base
  attr_accessible :title, :content, :publish_date

  validates_presence_of :title, :content, :publish_date
  validates_uniqueness_of :title, :content

  validates :publish_date, date: true
end