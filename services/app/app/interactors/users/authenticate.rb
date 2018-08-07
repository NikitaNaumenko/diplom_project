# frozen_string_literal: true

module Users
  class Authenticate < ApplicationInteractor
    def call
      return context.failure!(errors: 'Invalid credentials') unless user
      context.token = JsonWebToken.encode(user_id: user.id)
    end

    private

    def email
      context.email
    end

    def password
      context.password
    end

    def user
      user = User.find_by(email: email)
      user&.authenticate(password)
    end
  end
end
