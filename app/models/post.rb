# TODO: Implement image dimensions validator. Must validate only if image is present

class Post < ActiveRecord::Base
  attr_accessible :title, :body, :publish_date, :image

  has_attached_file :image, styles: { thumb: '314x108#' }

  validates_presence_of :title, :body, :publish_date
  validates_uniqueness_of :title, :body

  validates :publish_date, date: true

  # validate :file_dimensions

  scope :published, where("publish_date <= ?", Date.current).order("publish_date DESC")

  private

  # def file_dimensions(width = 680, height = 234)
  #   dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)
  #   unless dimensions.width == width && dimensions.height == height
  #     errors.add :image, "Width must be #{width}px and height must be #{height}px"
  #   end
  # end
end