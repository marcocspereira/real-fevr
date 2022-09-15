require 'jwt'

class JsonWebToken

  # SECRET_KEY is the key for encoding and decoding token
  SECRET_KEY = Rails.application.secret_key_base

  # @param payload [Hash] key-value object for
  #   holding data that want to be encoded
  # @param exp [String] stand for expiration for holding
  #   expiration time token. If exp not specified it will give you default
  #   value in 1 hour
  def self.encode(payload, exp = 1.hour.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

    # @param token [String] given by user
  def self.decode(token)
    # get payload; first index in decoded Array
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
    # rescue from all decode errors
  rescue JWT::DecodeError => e
    # raise custom error to be handled by custom handler
    raise ExceptionHandler::InvalidToken, e.message
  end
end