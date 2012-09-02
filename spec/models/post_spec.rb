require 'spec_helper'

describe Post do
  it "has a valid factory" do
    FactoryGirl.build(:post).should be_valid
  end

  it "is invalid without a title" do
    FactoryGirl.build(:post, title: nil).should_not be_valid
  end

  it "is invalid without content" do
    FactoryGirl.build(:post, content: nil).should_not be_valid
  end

  it "has a unique title" do
    FactoryGirl.create(:post, title: 'hola')
    FactoryGirl.build(:post, title: 'hola').should_not be_valid
  end

  it "has unique content" do |variable|
    FactoryGirl.create(:post, content: 'hola')
    FactoryGirl.build(:post, content: 'hola').should_not be_valid
  end
end