require 'spec_helper'

describe Image do
  before :each do
    @image = build(:image)
  end

  it { should respond_to :file }

  it "is invalid with wrong dimensions" do
    @image.file = File.new("spec/fixtures/image/dimensions.jpg")
    @image.should_not be_valid
  end

  it "is invalid with wrong content-type" do
    @image.file = File.new("spec/fixtures/image/content-type.gif")
    @image.should_not be_valid
  end

  it "is invalid with wrong height" do
    @image.file = File.new("spec/fixtures/image/height.jpg")
    @image.should_not be_valid
  end

  it "is invalid with wrong width" do
    @image.file = File.new("spec/fixtures/image/width.jpg")
    @image.should_not be_valid
  end

  it "is invalid with wrong size"
end