require 'spec_helper'

describe ProductsController do
  before :each do
    @product = create(:product)
    @product2 = create(:product, title: 'abc')
  end

  describe "GET #index" do
    it "populates an array of products" do
      get :index
      assigns(:products).should eq [@product2, @product]
    end

    it "renders the :index view" do
      get :index
      response.should render_template 'index'
    end

    it "populates an array of the categories"
  end

  describe "GET #show" do
    it "assigns the requested product to @product" do
      get :show, id: @product
      assigns(:product).should eq @product
    end

    it "renders the :show view" do
      get :show, id: @product
      response.should render_template 'show'
    end
  end
end