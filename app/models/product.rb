class Product < ActiveRecord::Base
  attr_accessible :name, :description, :images, :images_attributes

  has_many :images, as: :imageable

  accepts_nested_attributes_for :images, allow_destroy: true

  validates_uniqueness_of :name
  validates_presence_of :name, :description, :images

  # TODO: belongs_to :category (discuss)
  # TODO: has_many attributes through categories (discuss)
end