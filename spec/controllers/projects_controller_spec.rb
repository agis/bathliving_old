require 'spec_helper'

describe ProjectsController do
  before :each do
    @project = create(:project)
  end

  describe "GET #index" do
    it "assigns an array of products to @projects" do
      get :index
      assigns(:projects).should eq [@project] # test this with more projects
    end

    it "renders the :index view" do
      get :index
      response.should render_template 'index'
    end
  end

  describe "GET #show" do
    it "assigns the requested product to @project" do
      get :show, id: @project
      assigns(:project).should eq @project
    end

    it "renders the :show view" do
      get :show, id: @project
      response.should render_template 'show'
    end
  end
end