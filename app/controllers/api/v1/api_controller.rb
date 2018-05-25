module Api
  module V1
    class ApiController < ApplicationController
      protect_from_forgery with: :null_session
      include ::ActionController::Serialization
      include DeviseTokenAuth::Concerns::SetUserByToken

      before_action :skip_session_storage
      before_action :authenticate_user!, except: :status

      layout false
      respond_to :json

      rescue_from ActiveRecord::RecordNotFound,        with: :render_not_found
      rescue_from ActiveRecord::RecordInvalid,         with: :render_record_invalid
      rescue_from ActionController::RoutingError,      with: :render_not_found
      rescue_from ActionController::UnknownController, with: :render_not_found
      rescue_from AbstractController::ActionNotFound,  with: :render_not_found
      rescue_from ActionController::ParameterMissing,  with: :render_missing_parameter
      rescue_from Apipie::ParamError do |e|
        render json: { error: { message: e.message } }, status: :unprocessable_entity
      end
      # rescue_from Exceptions::ParameterInvalid,        with: :wrong_parameter
      # rescue_from Exceptions::AuthorizationException,  with: :unauthorized_exception

      def wrong_parameter(exception)
        render json: { errors: "Wrong parameter '#{exception.parameter}'" }, status: :unprocessable_entity
      end

      def status
        render json: { online: true }
      end

      def render_forbidden_access(exception)
        logger.info(exception) # for logging
        render json: { error: 'Not Authorized' }, status: :forbidden
      end

      def render_not_found(exception)
        logger.info(exception) # for logging
        render json: { error: 'Couldn\'t find the record' }, status: :not_found
      end

      def render_record_invalid(exception)
        logger.info(exception) # for logging
        render json: { errors: exception.record.errors.as_json }, status: 600
      end

      def render_missing_parameter(exception)
        logger.info(exception) # for logging
        render json: { error: exception.to_s }, status: :bad_request
      end

      def render_argument_invalid(exception)
        logger.info(exception) # for logging
        render json: { errors: exception.message }, status: :bad_request
      end

      def unauthorized_exception(exception)
        render json:
          { errors: "Unauthorized access to profile of user with id '#{exception.parameter}'" }, status: :unauthorized
      end

      private

      def skip_session_storage
        # Devise stores the cookie by default, so in api requests, it is disabled
        # http://stackoverflow.com/a/12205114/2394842
        request.session_options[:skip] = true
      end

    end
  end
end
