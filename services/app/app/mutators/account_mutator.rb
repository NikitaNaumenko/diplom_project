# frozen_string_literal: true

# Incapsulate logic for accounts
class AccountMutator
  class << self
    def create!(params)
      account = AccountType.create(params)
      AccountWorker.perform_async(account)
      account
    end
  end
end
