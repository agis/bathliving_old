class ProductCategory < ActiveRecord::Base
  attr_accessible :title

  validates :title, presence: true, uniqueness: true
end