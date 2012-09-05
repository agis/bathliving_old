require 'spec_helper'

describe Product do
  before :each do
    @product = FactoryGirl.build(:product)
  end

  it "has a valid factory" do
    @product.should be_valid
  end

  it "is invalid without a title" do
    @product.title = " "
    @product.should_not be_valid
  end

  it "is invalid without a description" do
    @product.description = " "
    @product.should_not be_valid
  end

  it "is invalid without images" do
    @product.images = []
    @product.should_not be_valid
  end

  it "has a unique title" do
    FactoryGirl.create(:product, title: 'hola')
    @product.title = 'hola'
    @product.should_not be_valid
  end
end