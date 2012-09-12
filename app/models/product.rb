class Product < ActiveRecord::Base
  attr_accessible :title, :description,
                  :images, :images_attributes,
                  :product_category_id, :link

  has_many :images, as: :imageable
  belongs_to :category, class_name: 'ProductCategory', foreign_key: :product_category_id

  accepts_nested_attributes_for :images, allow_destroy: true

  validates_uniqueness_of :title
  validates_presence_of :title, :description, :images, :category

  # TODO: implement link validator

  default_scope order("id DESC")
end