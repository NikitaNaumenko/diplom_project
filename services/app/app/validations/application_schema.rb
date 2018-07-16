# frozen_string_literal: true

ApplicationSchema = Dry::Validation.Schema do
  configure do
    config.messages = :i18n
  end
end
