class AccountMutator
  class << self
    def create!(params)
      AccountType.create(params)
    end
  end
end
