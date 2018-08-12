# frozen_string_literal: true

# Type for work with Account model
class AccountType < Account
  include ApplicationType

  permit :name, :phone, :email, user: {}
end
