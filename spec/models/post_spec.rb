require 'spec_helper'

describe Post do
  before :each do
    @post = FactoryGirl.build(:post)
  end

  it "has a valid factory" do
    @post.should be_valid
  end

  it "is invalid without a title" do
    @post.title = " "
    @post.should_not be_valid
  end

  it "is invalid without content" do
    @post.content = " "
    @post.should_not be_valid
  end

  it "has a unique title" do
    FactoryGirl.create(:post, title: 'hola')
    @post.title = 'hola'
    @post.should_not be_valid
  end

  it "has unique content" do
    FactoryGirl.create(:post, content: 'hola')
    @post.content = 'hola'
    @post.should_not be_valid
  end

  it "is invalid without a publish date" do
    @post.publish_date = nil
    @post.should_not be_valid
  end
end