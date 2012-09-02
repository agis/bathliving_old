include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :product do |f|
    f.name "A product name"
    f.description "Some description goes here."
    f.images { [FactoryGirl.create(:image)] }
  end

  factory :image do |f|
    f.file { fixture_file_upload "spec/fixtures/img.jpg", "image/jpg" }
  end
end