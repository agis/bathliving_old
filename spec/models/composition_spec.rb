require 'spec_helper'

describe Composition do
  before :each do
    @composition = FactoryGirl.build(:composition)
  end

  it "has a valid factory" do
    @composition.should be_valid
  end

  it "is invalid without a title" do
    @composition.title = " "
    @composition.should_not be_valid
  end

  it "is invalid without a description" do
    @composition.description = " "
    @composition.should_not be_valid
  end

  it "is invalid without images" do
    @composition.images = []
    @composition.should_not be_valid
  end

  it "has a unique title" do
    FactoryGirl.create(:composition, title: 'hola')
    @composition.title = 'hola'
    @composition.should_not be_valid
  end
end