class AccountWorker
  include Sidekiq::Worker

  def perform(account)
  end
end
