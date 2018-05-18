# frozen_string_literal: true

# Creates base data for account
class AccountWorker
  include Sidekiq::Worker

  def perform(account); end
end
