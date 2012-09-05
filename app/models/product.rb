class Product < ActiveRecord::Base
  attr_accessible :title, :description, :images, :images_attributes

  has_many :images, as: :imageable

  accepts_nested_attributes_for :images, allow_destroy: true

  validates_uniqueness_of :title
  validates_presence_of :title, :description, :images
end