module Api
  module V1
    class FeedbacksController < Api::V1::ApiController
      # skip_before_action :verify_authenticity_token
      skip_before_action :authenticate_user!, raise: false

      def create
        Feedback.create!(feedback_params)
       render json: { success: 'Your feedback succesfully sended' }, status: :ok
      end

      private

      def feedback_params
        params.require(:feedback).permit(:name, :phone_number, :email, :message)
      end

    end
  end
end
