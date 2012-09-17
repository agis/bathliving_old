class MainController < ApplicationController
  caches_action :home

  def home
    @projects = Project.limit(4)
    @products = Product.limit(8)
    @posts = Post.published.limit(8)
  end

  def about; end
end