# Type for work account model
class AccountType < Account
  VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  include ApplicationType

  permit :name, :email, :phone, :registred_user_name
  validates :email, format: { with: VALID_EMAIL_REGEXP }
end
