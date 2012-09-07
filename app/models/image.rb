class Image < ActiveRecord::Base
  attr_accessible :file

  has_attached_file :file,
                     styles: { default: '680x530', thumb: '150x150' }

  belongs_to :imageable, polymorphic: true

  validates_attachment :file,
                        presence: true,
                        size: { in: 0..600.kilobytes },
                        content_type: { content_type: 'image/jpeg' }

  # TODO: styles must depend on the parent object eg. Image or Composition?
  # see https://github.com/thoughtbot/paperclip#dynamic-configuration
end