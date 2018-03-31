require 'test_helper'

class Api::AccountsControllerTest < ActionDispatch::IntegrationTest
  test 'posts create' do
    account_params = { name: 'name',
                       email: 'email',
                       phone: '12345678',
                       registred_user_name: 'name' }

    post accounts_url, params: { account: account_params }

    last_account = Account.find_by(name: 'name')
    assert(last_account.persisted?)
  end
end
