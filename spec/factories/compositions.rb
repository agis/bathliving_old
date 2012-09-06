FactoryGirl.define do
  factory :composition do |f|
    f.title 'A composition title'
    f.description 'Some description goes here.'
    f.images { [build(:image)] }
  end
end