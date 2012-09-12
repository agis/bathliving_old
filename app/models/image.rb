class Image < ActiveRecord::Base
  attr_accessible :file

  belongs_to :imageable, polymorphic: true

  has_attached_file :file,
                     styles: { thumb: '220x175#', thumb_big: '460x311#' }

  validates_attachment :file,
                        presence: true,
                        size: { in: 0..600.kilobytes },
                        content_type: { content_type: 'image/jpeg' }

  validate :file_dimensions

  private

  def file_dimensions(width = 680, height = 540)
    dimensions = Paperclip::Geometry.from_file(file.queued_for_write[:original].path)
    unless dimensions.width == width && dimensions.height == height
      errors.add :file, "Width must be #{width}px and height must be #{height}px"
    end
  end
end

# TODO: styles must depend on the parent object eg. Image or Project?
# see https://github.com/thoughtbot/paperclip#dynamic-configuration