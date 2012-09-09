class ProductCategory < ActiveRecord::Base
  attr_accessible :title

  has_many :products

  # TODO: Add more validations
  validates :title, presence: true, uniqueness: true
end