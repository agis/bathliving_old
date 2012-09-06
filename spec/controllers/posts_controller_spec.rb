require 'spec_helper'

describe PostsController do
  before :each do
    @post = create(:post)
  end

  describe "GET #index" do
    it "assigns an array of posts to @posts" do
      get :index
      assigns(:posts).should eq [@post]
    end

    it "renders the :index view" do
      get :index
      response.should render_template 'index'
    end
  end

  describe "GET #show" do
    it "assigns the requested post to @post" do
      get :show, id: @post
      assigns(:post).should eq @post
    end

    it "renders the :show view" do
      get :show, id: @post
      response.should render_template 'show'
    end
  end
end