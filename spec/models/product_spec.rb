require 'spec_helper'

describe Product do
  before :each do
    @product = FactoryGirl.build(:product)
  end

  it "has a valid factory" do
    @product.should be_valid
  end

  it "is invalid without a name" do
    @product.name = " "
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

  it "has a unique name" do
    FactoryGirl.create(:product, name: 'hola')
    @product.name = 'hola'
    @product.should_not be_valid
  end
end