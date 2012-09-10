# encoding: utf-8

FactoryGirl.define do
  factory :product do |f|
    f.title 'A product title'
    f.description 'Some description goes here.'
    f.images { [build(:image)] }
    f.category { build(:product_category) }
    f.link 'http://e-bath.net/έπιπλα-μπάνιου/έπιπλο-μπάνιου-eco-13-45cm'
  end
end