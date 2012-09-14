class Project < ActiveRecord::Base
  attr_accessible :title, :subtitle, :description, :images, :images_attributes, :slide_image

  has_many :images, as: :imageable
  has_attached_file :slide_image, styles: { thumb: '298x120#' }

  accepts_nested_attributes_for :images, allow_destroy: true

  validates_presence_of :title, :subtitle, :description, :images
  validates_attachment :slide_image,
                           presence: true,
                           size: { in: 0..600.kilobytes },
                           content_type: { content_type: 'image/jpeg' }


  default_scope order("id DESC")
end