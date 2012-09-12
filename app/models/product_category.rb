require 'unicode_utils/titlecase'

class ProductCategory < ActiveRecord::Base
  attr_accessible :title

  validates :title, presence: true, uniqueness: true

  before_save do |c|
    c.title = UnicodeUtils.titlecase(c.title)
  end
end