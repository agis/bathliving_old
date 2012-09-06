require 'spec_helper'

describe Post do
  before :each do
    @post = build(:post)
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
    create(:post, content: 'hola')
    @post.content = 'hola'
    @post.should_not be_valid
  end

  it "is invalid without a publish date" do
    @post.publish_date = nil
    @post.should_not be_valid
  end

  it "has a valid publish date" do
    @post.publish_date = "a"
    @post.should_not be_valid
  end
end