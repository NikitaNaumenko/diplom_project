# frozen_string_literal: true

class UserType < User
  include ApplicationType

  permit :first_name, :last_name, :email, :login, :password, :account_id
end
