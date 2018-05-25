class ProductsController < ApplicationController
  before_action :set_products
  skip_before_action :authenticate_user!, raise: false

  def index
    Product.all
  end

  private
    def set_products
      @products = Product.order(created_at: :desc)
    end
end
