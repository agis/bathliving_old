class Product < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :images
  # belongs_to :category

  validates_presence_of :name, :description
end
