class ProductsController < ApplicationController
  def index
    @products = Product.limit(16)
    set_categories(@products)
  end

  def show
    @product = Product.find(params[:id])
    @previous_product = neighboor(:previous)
    @next_product = neighboor(:next)
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

  def neighboor(direction)
    begin
      return Product.find(params[:id].to_i + 1) if direction == :previous
      return Product.find(params[:id].to_i - 1) if direction == :next
    rescue
      "#"
    end
  end
end