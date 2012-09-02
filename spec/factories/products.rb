FactoryGirl.define do
  factory :product do |f|
    f.name "A product name"
    f.description "Some description goes here."
    f.images { [FactoryGirl.create(:image)] }
  end

  factory :image do |f|
    f.file { File.new("spec/fixtures/img.jpg") }
  end
end