class Image < ActiveRecord::Base
  attr_accessible :file
  attr_accessor :file_file_name

  has_attached_file :file, :styles => { :default => "150x150" }

  belongs_to :imageable, polymorphic: true
end