class ProductsController < ApplicationController
  def index
    @products = Product.limit(16)
    @categories = ProductCategory.all
  end

  def show
    @product = Product.find(params[:id])
  end
end