# User store for db
class User < ApplicationRecord
  belongs_to :account
end
