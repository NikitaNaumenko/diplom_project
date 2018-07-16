# frozen_string_literal: true

module Api
  # Controller for accounts
  class AccountsController < Api::ApplicationController
    def create
      validation_result = account_mutator.validate!(account_params)
      if validation_result.success?
        account = account_mutator.create!(account_params)
        respond_for_create(account, AccountSerializer)
      else
        respond_for_validation_errors(Account, validation_result.errors, ErrorsSerializer)
      end
    end

    private

    def account_params
      params.require(:account)
    end

    def account_mutator
      @account_mutator ||= AccountMutator
    end
  end
end
