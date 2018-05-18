# frozen_string_literal: true

require 'test_helper'

class AccountTypeTest < ActiveSupport::TestCase
  def setup
    params = {
      name: 'account',
      email: 'account@mail.ru',
      phone: '12345678',
      registred_user_name: ' account'
    }
    @account = AccountType.new(params)
  end

  test 'should be valid' do
    @account.save
    last = Account.find(@account.id)
    assert(last.persisted?)
  end
end
