require 'unicode_utils/titlecase'

class Post < ActiveRecord::Base
  attr_accessible :title, :body, :publish_date, :image

  has_attached_file :image, styles: { thumb: '314x108#' }

  validates_presence_of :title, :body, :publish_date
  validates_uniqueness_of :title, :body

  validates :publish_date, date: true
  validates :image, dimensions: { width: 680, height: 234 }

  scope :published, where("publish_date <= ?", Date.current).order("publish_date DESC")

  before_save do |p|
    p.title = UnicodeUtils.titlecase(p.title)
  end
end