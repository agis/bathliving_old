class ProductsController < ApplicationController
  def index
    @products = Product.limit(16)
    set_categories(@products)
  end

  def show
    @product = Product.find(params[:id])
    @previous_product = neighboor(Product, :previous)
    @next_product = neighboor(Product, :next)
  end

  private

  def set_categories(products)
    @categories = Set[]

    products.each { |product| @categories << product.category }
  end
end