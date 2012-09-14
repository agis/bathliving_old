# encoding: utf-8

require 'spec_helper'

describe Project do
  before :each do
    @project = build(:project)
  end

  it { should respond_to :title }
  it { should respond_to :subtitle }
  it { should respond_to :description  }
  it { should respond_to :images }
  it { should respond_to :slide_image }

  it "is invalid without a title" do
    @project.title = " "
    @project.should_not be_valid
  end

  it "is invalid without a subtitle" do
    @project.subtitle = " "
    @project.should_not be_valid
  end

  it "is invalid without a description" do
    @project.description = " "
    @project.should_not be_valid
  end

  it "is invalid without images" do
    @project.images = []
    @project.should_not be_valid
  end

  context "slide image" do

    it "is invalid without a slide image" do
      @project.slide_image = nil
      @project.should_not be_valid
    end

    it "is invalid with a wrong content-type image" do
      @project.slide_image = File.new("spec/fixtures/image/wrong-content-type.gif")
      @project.should_not be_valid
    end

    # it "is invalid with a wrong-dimensions image" do
    #   @project.slide_image = File.new("spec/fixtures/image/wrong-dimensions.jpg")
    #   @project.should_not be_valid
    # end

  end
end