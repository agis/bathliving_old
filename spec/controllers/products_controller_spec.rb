require 'spec_helper'

describe ProductsController do
  before :each do
    @product = create(:product)
  end

  describe "GET #index" do
    it "assigns an array of products to @products" do
      get :index
      assigns(:products).should eq [@product]
    end

    it "renders the :index view" do
      get :index
      response.should render_template 'index'
    end
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