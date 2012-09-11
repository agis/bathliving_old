class ProductsController < ApplicationController
  def index
    @products = Product.limit(16)
    set_categories(@products)
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def set_categories(products)
    @categories = []

    products.each do |p|
      unless @categories.include? p.category
        @categories << p.category
      end
    end
  end

end