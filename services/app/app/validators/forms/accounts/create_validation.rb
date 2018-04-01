module Forms
  module Accounts
    CreateValidation = Dry::Validation.Form(Forms::BaseValidation) do
      config do
        config.namespace = :accounts
      end

      required(:email).filled(:str?)
      required(:name).filled(:str?)
      required(:phone).filled(:str?)
      required(:registred_user_name).filled(:str?)
    end
  end
end
