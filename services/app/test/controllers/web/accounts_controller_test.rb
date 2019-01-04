# frozen_string_literal: true

require 'test_helper'

module Web
  class AccountsControllerTest < ActionDispatch::IntegrationTest
    def create_params
      {
        name: 'Account1',
        email: 'account1@mail.ru',
        users_attributes: [
          {
            first_name: 'firstName',
            email: 'email@email.ru',
            password: '1234',
            password_confirmation: '1234'
          }
        ]
      }
    end

    def wrong_params
      {
        name: 'Account1'
      }
    end

    test 'request new should response success' do
      get new_account_url
      assert_response :success
    end

    test 'should create account' do
      assert_difference('Account.count') do
        post accounts_url, params: { account: create_params }
      end
    end

    test 'response should have redirect_path' do
      post accounts_url, params: { account: create_params }
      assert_equal '/users', JSON.parse(@response.body)['redirect_path']
    end

    test 'should not create account' do
      assert_no_difference('Account.count') do
        post accounts_url, params: { account: wrong_params }
      end
    end

    test 'response should have redirect to new account url' do
      post accounts_url, params: { account: wrong_params }
      assert_equal '/accounts/new', JSON.parse(@response.body)['redirect_path']
    end

    test 'response should have errors' do
      post accounts_url, params: { account: wrong_params }
      assert_not_empty JSON.parse(@response.body)['errors']
    end
  end
end
