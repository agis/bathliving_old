class MainController < ApplicationController
  def home
    @projects = Project.limit(4)
    @products = Product.limit(8)
    @posts = Post.published.limit(8)
  end

  def contact
  end

  def about
  end
end