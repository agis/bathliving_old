FactoryGirl.define do
  factory :image do |f|
    f.file { File.new("spec/fixtures/image/valid.jpg") }
  end
end