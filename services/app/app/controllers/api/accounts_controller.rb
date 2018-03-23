module Api
  class AccountsController < Api::ApplicationController
    def create
      if validation.success?
        account = AccountMutator.create!(permitted_attribute)
        respond_for_save(account, AccountSerializer.new(account).serialized_json)
      else
        respond_for_validation_errors(validation.errors)
      end
    end

    private

    def permitted_attribute
      params.require(:account)
    end

    def validation
      Forms::Accounts::CreateValidation.call(permitted_attribute)
    end
  end
end
