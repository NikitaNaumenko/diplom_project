# frozen_string_literal: true

class Account
  class MoiKrugSecret < ApplicationRecord
    belongs_to :account

    validates :client_id, presence: true
    validates :client_secret, presence: true

    def encryption_client_id
      client_secret.dup.tap { |p| p[3...32] = '****' }
    end

    def encryption_client_secret
      client_id.dup.tap { |p| p[3...32] = '****' }
    end
  end
end
