FactoryGirl.define do
  factory :project do |f|
    f.title 'A project title'
    f.subtitle 'Some subtitle bro'
    f.description 'Some description goes here.'
    f.images { [build(:image)] }
    f.slide_image { File.new("spec/fixtures/image/valid-project_slide-image.jpg") }
  end
end