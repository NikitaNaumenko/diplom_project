# frozen_string_literal: true

AccountSchema = Dry::Validation.Schema(ApplicationSchema) do
  configure do
    config.namespace = :accounts

    def uniq?(attr_name, value)
      !Account.exists?(attr_name => value)
    end
  end

  required(:name).filled(:str?)
  optional(:phone).filled(:str?)
  required(:email).filled(:str?, format?: ApplicationConstants::EMAIL_FORMAT, uniq?: :email)
end
