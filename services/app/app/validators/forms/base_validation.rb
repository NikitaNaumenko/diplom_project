module Forms
  # Base dry validation schema
  class BaseValidation < Dry::Validation::Schema
    configure do
      config.messages_file = 'config/locales/validation_errors.yml'
      config.messages = :i18n
    end
  end
end
