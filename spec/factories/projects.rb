FactoryGirl.define do
  factory :project do |f|
    f.title 'A project title'
    f.description 'Some description goes here.'
    f.images { [build(:image)] }
  end
end