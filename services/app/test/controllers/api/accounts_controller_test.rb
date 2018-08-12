# frozen_string_literal: true

require 'test_helper'

class Api::AccountsControllerTest < ActionDispatch::IntegrationTest
  test 'account create' do
    account_params = { name: 'account',
                       email: 'account@account.ru' }
    post accounts_url, params: { account: account_params }

    assert_response :created
  end

  test 'name is empty' do
    account_params = { name: '',
                       email: 'account@account.ru' }
    post accounts_url, params: { account: account_params }

    assert_response :unprocessable_entity
  end

  test 'email is empty' do
    account_params = { name: 'name',
                       email: '' }
    post accounts_url, params: { account: account_params }

    assert_response :unprocessable_entity
  end

  test 'email has wrong format' do
    account_params = { name: 'name',
                       email: 'email.ru' }
    post accounts_url, params: { account: account_params }

    assert_response :unprocessable_entity
  end
end
