# frozen_string_literal: true

# Define custom handler jwt error
module ExceptionHandler
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class ExpiredSignature < StandardError; end
  class DecodeError < StandardError; end

  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :unprocessable_entity
    rescue_from ExceptionHandler::InvalidToken, with: :unprocessable_entity
    rescue_from ExceptionHandler::ExpiredSignature, with: :token_expired
    rescue_from ExceptionHandler::DecodeError, with: :invalid_token

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  private

  HTTP_CODE_MAP = {
    unprocessable_entity: :unprocessable_entity,
    invalid_token: :invalid_token,
    token_expired: :invalid_token,
    unauthorized_request: :unauthorized
  }.freeze

  %i[unprocessable_entity invalid_token token_expired unauthorized_request].each do |code|
    define_method(code) { |e| render json: { message: e.message }, status: HTTP_CODE_MAP[code] }
  end
  # JSON response with message; Status code 422 - unprocessable entity
  # def unprocessable_entity(error)
  #   render json: { message: error.message }, status: :unprocessable_entity
  # end

  # # JSON response with message; Status code 401 - Unauthorized
  # def token_expired(error)
  #   render json: { message: error.message }, status: :invalid_token
  # end

  # # JSON response with message; Status code 401 - Unauthorized
  # def invalid_token(error)
  #   render json: { message: error.message }, status: :invalid_token
  # end

  # # JSON response with message; Status code 401 - Unauthorized
  # def unauthorized_request(error)
  #   render json: { message: e.message }, status: :unauthorized
  # end
end
