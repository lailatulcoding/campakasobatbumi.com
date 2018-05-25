module Api
  module V1
    class ProductsController < Api::V1::ApiController
      skip_before_action :verify_authenticity_token
      skip_before_action :authenticate_user!, raise: false

      def index
        @cities = City.all
        render json:  @cities
      end

      def show
        @province = City.find(params[:id])
        render json: @province
      end

    end
  end
end
