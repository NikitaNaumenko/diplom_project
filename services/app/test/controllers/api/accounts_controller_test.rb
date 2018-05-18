# frozen_string_literal: true

require 'test_helper'

class Api::AccountsControllerTest < ActionDispatch::IntegrationTest
  test 'posts create' do
    account_params = { name: 'name',
                       email: 'email@email.ru',
                       phone: '12345678',
                       registred_user_name: 'name' }

    post accounts_url, params: { account: account_params }

    assert_response :success
  end

  test 'should not save account without name' do
    account_params = { email: 'email@email.ru',
                       phone: '12345678',
                       registred_user_name: 'name' }

    post accounts_url, params: { account: account_params }
    assert_response :unprocessable_entity
  end

  test 'should not save account without email' do
    account_params = { name: 'name',
                       phone: '12345678',
                       registred_user_name: 'name' }

    post accounts_url, params: { account: account_params }
    assert_response :unprocessable_entity
  end

  test 'should not save account without phone' do
    account_params = { name: 'name',
                       email: 'email@email.ru',
                       registred_user_name: 'name' }

    post accounts_url, params: { account: account_params }
    assert_response :unprocessable_entity
  end

  test 'should not save account without registred_user_name' do
    account_params = { name: 'name',
                       email: 'email@email.ru',
                       phone: '12345678' }

    post accounts_url, params: { account: account_params }
    assert_response :unprocessable_entity
  end
end
