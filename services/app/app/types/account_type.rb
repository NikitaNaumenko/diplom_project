# Type for work account model
class AccountType < Account
  include ApplicationType

  permit :name, :email, :phone, :registred_user_name
end
