FactoryGirl.define do
  factory :product do |f|
    f.title 'A product title'
    f.description 'Some description goes here.'
    f.images { [build(:image)] }
  end
end