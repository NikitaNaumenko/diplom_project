# frozen_string_literal: true

require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require 'aasm/minitest'

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

module ActionDispatch
  class IntegrationTest
    def login(user)
      open_session do |sess|
        sess.https!
        sess.post sessions_url(params: {
                                 users_login_type: {
                                   email: user.email, password: '1234'
                                 }
                               }, subdomain: user.account.name)

        sess.https!(false)
      end
    end
  end
end
