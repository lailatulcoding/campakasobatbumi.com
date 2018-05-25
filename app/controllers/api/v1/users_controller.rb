module Api
  module V1
    class UsersController < Api::V1::ApiController
      before_action :user, only:[:show, :update]

      def show
        render json: @user
      end

      def update
        @user.update!(user_params)
        show
      end

      private

      def user
        @user ||= User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:name, :username, :avatar)
      end

    end
  end
end
