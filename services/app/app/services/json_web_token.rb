# frozen_string_literal: true

class JsonWebToken
  class << self

    def encode(payload, exp = 2.hours.from_now)
      # set token expiration time
      payload[:exp] = exp.to_i

      # this encodes the user data(payload) with our secret key
      puts Rails.application.secrets.secret_key_base
       #replaceRails.application.secrets.secret_key_base
      JWT.encode(payload, 'secrets')
    end

    def decode(token)
      # decodes the token to get user data (payload)
      body = JWT.decode(token, 'secrets').first
      HashWithIndifferentAccess.new(body)
    # raise custom error to be handled by custom handler
    rescue JWT::ExpiredSignature, JWT::VerificationError => e
      raise ExceptionHandler::ExpiredSignature, e.message
    rescue JWT::DecodeError, JWT::VerificationError => e
      raise ExceptionHandler::DecodeError, e.message
    end
  end
end
