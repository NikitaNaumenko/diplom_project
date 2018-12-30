# frozen_string_literal: true

# Type for account
class AccountType < Account
  include ApplicationType

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  permit :name, :phone, :email, users: %i[first_name password]
  validates :name, :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, length: { maximum: 50 }
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: VALID_EMAIL_REGEX }
end
