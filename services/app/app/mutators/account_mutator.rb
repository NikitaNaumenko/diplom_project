# frozen_string_literal: true

class AccountMutator
  class << self
    def create!(params)
      account_params = params.merge(registered_name: params[:name],
                                    registered_email: params[:email])
      # require 'byebug'
      # byebug
      AccountType.create(account_params)
    end

    def validate!(params)
      AccountSchema.call(params)
    end
  end
end
