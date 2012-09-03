FactoryGirl.define do
  factory :composition do |f|
    f.title "A composition name"
    f.description "Some ddescription goes here."
    f.images { [FactoryGirl.create(:image)] }
  end
end