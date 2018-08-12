# frozen_string_literal: true

class User < ApplicationRecord
  include InnerId

  before_create -> { next_inner_id(scope: :account) }
  has_secure_password

  belongs_to :account, optional: true
end
