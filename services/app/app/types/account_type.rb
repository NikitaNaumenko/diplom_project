class AccountType < Account
  include ApplicationType

  permit :name, :email, :phone
end
