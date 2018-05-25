# encoding: utf-8

module Api
  module V1
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      protect_from_forgery with: :null_session

      def temporary
        user = User.create!(temporary_user_params)
        new_auth_header = user.create_new_auth_token
        response.headers.merge!(new_auth_header)
        render json: user
      end

      private

      def temporary_user_params
        params.require(:user).permit(:name).merge(provider: 'phone')
      end

      def sign_up_params
        params.require(:user).permit(
          :email,
          :name,
          :username,
          :password
        )
      end

    end
  end
end
