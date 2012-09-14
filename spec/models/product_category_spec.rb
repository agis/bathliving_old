# encoding: utf-8

require 'spec_helper'

describe ProductCategory do
  before :each do
    @category = build(:product_category)
  end

  it { should respond_to :title }

  it "is invalid without a title" do
    @category.title = ' '
    @category.should_not be_valid
  end

  it "is invalid without a unique title" do
    create(:product_category, title: 'Hola')
    @category.title = 'Hola'
    @category.should_not be_valid
  end
end