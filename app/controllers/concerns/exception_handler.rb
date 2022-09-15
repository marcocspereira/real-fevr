# frozen_string_literal: true

# class that handles some the default response from some sof errors
module ExceptionHandler
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end

  class MissingToken < StandardError; end

  class InvalidToken < StandardError; end

  class PasswordDoNotMatch < StandardError; end

  included do
    # Define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request

    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :unauthorized_request
    rescue_from ExceptionHandler::PasswordDoNotMatch, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: { error: exception.message },
             status: :not_found
    end

    rescue_from ActiveRecord::RecordNotUnique do |exception|
      render json: { error: exception.message },
             status: :unprocessable_entity
    end

    rescue_from Pundit::NotAuthorizedError do
      render json: { error: 'Not enough privileges.' },
             status: :forbidden
    end
  end

  private

  # JSON response with message; Status code 422 - unprocessable entity
  def four_twenty_two(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_request(exception)
    render json: { error: exception.message }, status: :unauthorized
  end
end
