# frozen_string_literal: true

require 'test_helper'

module Web
  class AccountsControllerTest < ActionDispatch::IntegrationTest
    test '#new' do
      get new_account_url
      assert_response :success
    end
  end
end
