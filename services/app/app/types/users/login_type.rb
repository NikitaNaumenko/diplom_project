# frozen_string_literal: true

module Users
  # Type for login page
  class LoginType < User
    include ApplicationType

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

    permit :email, :password, :account_id
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :email, length: { maximum: 255 }
    validates :email, format: { with: VALID_EMAIL_REGEX }

    def name
      'users_login_type'
    end

    def model_name
      ActiveModel::Name.new(self, Users)
    end

    def authenticate_user?
      user&.authenticate(password)
    end

    def user
      account.users.find_by(email: email)
    end
  end
end
