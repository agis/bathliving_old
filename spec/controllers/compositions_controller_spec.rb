require 'spec_helper'

describe CompositionsController do
  before :each do
    @composition = create(:composition)
  end

  describe "GET #index" do
    it "assigns an array of products to @compositions" do
      get :index
      assigns(:compositions).should eq [@composition]
    end

    it "renders the :index view" do
      get :index
      response.should render_template 'index'
    end
  end

  describe "GET #show" do
    it "assigns the requested product to @composition" do
      get :show, id: @composition
      assigns(:composition).should eq @composition
    end

    it "renders the :show view" do
      get :show, id: @composition
      response.should render_template 'show'
    end
  end
end