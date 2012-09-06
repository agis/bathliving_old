require 'spec_helper'

describe MainController do
  describe "GET #home" do
    it "renders the home view" do
      get :home
      response.should render_template "home"
    end
  end

  describe "GET #contact" do
    it "renders the contact view"
  end
end