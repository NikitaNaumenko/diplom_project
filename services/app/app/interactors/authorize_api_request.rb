# frozen_string_literal: true

class AuthorizeApiRequest < ApplicationInteractor
  def call
    return context.failure!(errors: 'Invalid token') unless user
  end

  private

  def headers
    context.headers
  end

  def user
    decoded_auth_token = JsonWebToken.decode(http_auth_header)
    context.user = User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  end

  def http_auth_header
    return context.failure!(errors: 'Missing token') unless headers['Authorization'].present?
    headers['Authorization'].split(' ').last
  end
end
