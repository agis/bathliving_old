require 'unicode_utils/titlecase'

class Project < ActiveRecord::Base
  attr_accessible :title, :subtitle, :description, :images, :images_attributes, :slide_image

  has_many :images, as: :imageable
  has_attached_file :slide_image, styles: { thumb: '298x120#' }

  validates_presence_of :title, :subtitle, :slide_image, :description, :images
  validates_attachment :slide_image, presence: true
  validates :slide_image, dimensions: { width: 940, height: 380 }

  accepts_nested_attributes_for :images, allow_destroy: true

  default_scope order("id DESC")

  before_save do |p|
    p.title = UnicodeUtils.titlecase(p.title)
    p.subtitle = UnicodeUtils.titlecase(p.subtitle)
  end
end