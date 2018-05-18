# frozen_string_literal: true

module Forms
  module Accounts
    CreateValidation = Dry::Validation.Form(Forms::BaseValidation) do
      VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

      config do
        config.namespace = :accounts
      end

      required(:email).value(format?: VALID_EMAIL_REGEXP)
      required(:name).filled(:str?)
      required(:phone).filled(:str?)
      required(:registred_user_name).filled(:str?)
    end
  end
end
