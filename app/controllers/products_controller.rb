class ProductsController < ApplicationController
  before_action :set_products

  def index
  end

  private
    def set_products
      @products = Product.order(created_at: :desc)
    end
end
