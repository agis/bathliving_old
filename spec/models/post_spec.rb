# encoding: utf-8

require 'spec_helper'

describe Post do
  before :each do
    @post = build(:post)
  end

  it { should respond_to :title }
  it { should respond_to :body  }
  it { should respond_to :publish_date }
  it { should respond_to :image }

  it "is invalid without a title" do
    @post.title = " "
    @post.should_not be_valid
  end

  it "is invalid without body" do
    @post.body = " "
    @post.should_not be_valid
  end

  it "has a unique title" do
    create(:post, title: 'hola')
    @post.title = 'hola'
    @post.should_not be_valid
  end

  it "has unique body" do
    create(:post, body: 'hola')
    @post.body = 'hola'
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