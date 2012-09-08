require 'spec_helper'

describe Composition do
  before :each do
    @composition = build(:composition)
  end

  it { should respond_to :title }
  it { should respond_to :description  }
  it { should respond_to :images }

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
    create(:composition, title: 'hola')
    @composition.title = 'hola'
    @composition.should_not be_valid
  end

  it "is invalid if it contains an invalid image" do
    invalid_image = build(:image)
    invalid_image.file = File.new("spec/fixtures/image/content-type.gif")

    @composition.images << invalid_image
    @composition.should_not be_valid
  end
end