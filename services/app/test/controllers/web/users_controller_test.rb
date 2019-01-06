# frozen_string_literal: true

require 'test_helper'

module Web
  class UsersControllerTest < ActionDispatch::IntegrationTest
    def setup
      @user = users(:first_user)
      @account = accounts(:first_account)
      @user_session = login(@user)
    end

    def params
      {
        first_name: 'newUser',
        last_name: 'newLastname',
        email: 'newUser@mail.ru',
        password: '1234',
        password_confirmation: '1234'
      }
    end

    test 'should response have users collection' do
      @user_session.get users_url(subdomain: @account.name), as: :json
      assert_not_empty JSON.parse(@user_session.response.body)['users']
      assert_includes JSON.parse(@user_session.response.body)['users'], JSON.parse(users(:first_user).to_json)
    end

    test 'should response user by id' do
      @user_session.get user_url(subdomain: @account.name, id: users(:second_user).id),
                        as: :json
      assert_equal JSON.parse(@user_session.response.body)['user'], JSON.parse(users(:second_user).to_json)
    end

    test 'should response new be success' do
      @user_session.get new_user_url(subdomain: @account.name)
      @response = @user_session.response
      assert_response :success
    end

    test 'should create user' do
      assert_difference('@account.users.count') do
        @user_session.post users_url(params: { user: params }, subdomain: @account.name), as: :json
      end
    end

    test 'should have right redirect path after create' do
      @user_session.post users_url(params: { user: params }, subdomain: @account.name), as: :json
      assert_equal "/users/#{@account.users.last.id}",
                   JSON.parse(@user_session.response.body)['redirect_path']
    end

    test 'should response have edited user' do
      @user_session.get edit_user_url(subdomain: @account.name, id: users(:second_user).id), as: :json
      assert_equal JSON.parse(@user_session.response.body)['user'],
                   JSON.parse(users(:second_user).to_json)
    end

    test 'should response have right redirect path after update' do
      @user_session.patch user_url(id: users(:second_user).id, params: { user: params },
                                   subdomain: @account.name), as: :json
      assert_equal "/users/#{users(:second_user).id}",
                   JSON.parse(@user_session.response.body)['redirect_path']
    end
  end
end
