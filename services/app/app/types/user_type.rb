# frozen_string_literal: true

# Type for users
class UserType
  include ApplicationType

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  permit :first_name, :last_name, :email, :password_digest
  validates :name, :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, length: { maximum: 50 }
  validates :email, length: { maximum: 255 }
  validates :email, format: { with: VALID_EMAIL_REGEX }
end
