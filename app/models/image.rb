class Image < ActiveRecord::Base
  attr_accessible :file

  has_attached_file :file, 
                    styles: { default: "150x150" }, 
                    default_url: "missing.png"

  belongs_to :imageable, polymorphic: true
end