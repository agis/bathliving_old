class ProductsController < ApplicationController
  def index
    @products = Product.limit(16)
  end

  def show
    @product = Product.find(params[:id])
  end
end