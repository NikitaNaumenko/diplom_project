# frozen_string_literal: true

require 'test_helper'

module Web
  class UsersControllerTest < ActionDispatch::IntegrationTest
    def setup
      @user = users(:first_user)
      @user_session = login(@user)
    end

    test 'should response have users collection' do
      @user_session.get users_url(subdomain: accounts(:first_account).name), as: :json
      assert_not_empty JSON.parse(@user_session.response.body)['users']
      assert_includes JSON.parse(@user_session.response.body)['users'], JSON.parse(users(:first_user).to_json)
    end
  end
end
