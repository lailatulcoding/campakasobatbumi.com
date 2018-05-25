module Api
  module V1
    class ProductsController < Api::V1::ApiController
      skip_before_action :authenticate_user!, raise: false
      
      def index
        @products = Product.all
        render json:  @products
      end

      def show
        @product = Product.find(params[:id])
        render json: @product
      end

    end
  end
end
