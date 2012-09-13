class Image < ActiveRecord::Base
  attr_accessible :file

  belongs_to :imageable, polymorphic: true

  has_attached_file :file,
                     styles: { thumb: '220x175#', thumb_big: '460x311#' }

  validates_attachment :file,
                        presence: true,
                        size: { in: 0..600.kilobytes },
                        content_type: { content_type: 'image/jpeg' }

  # validates :file, dimensions: { width: 680, height: 540 }

end

# TODO: styles must depend on the parent object eg. Image or Project?
# see https://github.com/thoughtbot/paperclip#dynamic-configuration