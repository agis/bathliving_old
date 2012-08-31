class Product < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :images
  # belongs_to :category
end
