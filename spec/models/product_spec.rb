# encoding: utf-8

require 'spec_helper'

describe Product do
  before :each do
    @product = build(:product)
  end

  it { should respond_to :title }
  it { should respond_to :description  }
  it { should respond_to :images }
  it { should respond_to :category }
  it { should respond_to :link }

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
    create(:product, title: 'Hola')
    @product.title = 'Hola'
    @product.should_not be_valid
  end

  it "is invalid without a category" do
    @product.category = nil
    @product.should_not be_valid
  end

  it "has a proper link"
end