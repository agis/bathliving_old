class Post < ActiveRecord::Base
  attr_accessible :title, :body, :publish_date, :image

  has_attached_file :image, styles: { thumb: '314x108#', home_thumb: '220x76#' }

  validates_presence_of :title, :body, :publish_date
  validates_uniqueness_of :title, :body

  validates :publish_date, date: true

  scope :published, -> { where("publish_date <= ?", Date.today).order("publish_date DESC") }
end