# frozen_string_literal: true

# Type for work with Account model
class AccountType < Account
  include ApplicationType

  permit :name, :phone, :email, :registered_name, :registered_email
  attr_accessor :phone
end
