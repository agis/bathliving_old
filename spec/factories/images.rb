FactoryGirl.define do
  factory :image do |f|
    f.file { File.new("spec/fixtures/img.jpg") }
  end
end