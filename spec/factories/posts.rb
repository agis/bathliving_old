FactoryGirl.define do
  factory :post do |f|
    f.title "Just some title goes here yeah"
    f.body "This could be the content. It must be soon enough good enough
              in order to highlight the quality of our product. The purity,
              and the other madskills they may have before us. And yeah, bye."
    f.publish_date Date.today
  end
end