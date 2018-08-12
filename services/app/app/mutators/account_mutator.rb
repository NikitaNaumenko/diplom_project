# frozen_string_literal: true

class AccountMutator
  class << self
    def create!(params)
      account_params = params.except(:user)
      AccountType.create(account_params).tap do |account|
        user_params = params.require(:user).merge(account_id: account.id)
        UserMutator.create!(user_params)
      end
    end

    def validate!(params)
      AccountSchema.call(params)
    end
  end
end
