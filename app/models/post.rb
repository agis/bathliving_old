class Post < ActiveRecord::Base
  attr_accessible :title, :body, :publish_date

  validates_presence_of :title, :body, :publish_date
  validates_uniqueness_of :title, :body

  validates :publish_date, date: true
end