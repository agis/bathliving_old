require 'spec_helper'

describe Product do
  it "has a valid factory" do
    FactoryGirl.create(:product).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:product, name: nil).should_not be_valid
  end

  it "is invalid without a description" do
    FactoryGirl.build(:product, description: nil).should_not be_valid
  end

  it "is invalid without images" do
    FactoryGirl.build(:product, images: []).should_not be_valid
  end

  it "has a unique name" do
    FactoryGirl.create(:product)
    FactoryGirl.build(:product).should_not be_valid
  end
end