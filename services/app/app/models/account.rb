# frozen_string_literal: true

# Account store for db
class Account < ApplicationRecord
  has_many :users
end
