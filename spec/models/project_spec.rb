# encoding: utf-8

require 'spec_helper'

describe Project do
  before :each do
    @project = build(:project)
  end

  it { should respond_to :title }
  it { should respond_to :description  }
  it { should respond_to :images }

  it "is invalid without a title" do
    @project.title = " "
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

  it "has a unique title" do
    create(:project, title: 'Hola')
    @project.title = 'Hola'
    @project.should_not be_valid
  end

  it "is invalid if it contains an invalid image" do
    invalid_image = build(:image)
    invalid_image.file = File.new("spec/fixtures/image/content-type.gif")

    @project.images << invalid_image
    @project.should_not be_valid
  end

  it "has a titleized title" do
    @project.title = 'τΕσΤ Δε ΤαΙτΛ'
    @project.save

    @project.title.should eq 'Τεστ Δε Ταιτλ'
  end
end