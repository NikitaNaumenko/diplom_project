# frozen_string_literal: true

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
    @account = Account.new(name: 'AccountName', email: 'account@account.ru', phone: '89376568787')
  end

  test 'should be valid' do
    assert @account.valid?
  end

  test 'name should be present' do
    @account.name = ' '
    assert_not @account.valid?
  end

  test 'email should be present' do
    @account.email = ' '
    assert_not @account.valid?
  end

  test 'email should not be too long' do
    @account.email = 'a' * 244 + '@example.com'
    assert_not @account.valid?
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp
                         jpalice+bob@baz.cn]
    valid_addresses.each do |address|
      @account.email = address
      assert @account.valid?, "#{address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @account.email = invalid_address
      assert_not @account.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email address should be unique' do
    dup_account = @account.dup
    dup_account.email = @account.email.upcase
    @account.save
    assert_not dup_account.valid?
  end

  test 'email address should be save as lower-case' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @account.email = mixed_case_email
    @account.save
    assert_equal mixed_case_email.downcase, @account.reload.email
  end

  test 'account should accepts nested attributes for users' do
    params = { name: 'AccountName', email: 'account@account.ru', phone: '89376568787',
               users_attributes: [{ first_name: 'user',
                                    email: 'user@mail.ru',
                                    password: '1234',
                                    password_confirmation: '1234' }] }
    account = Account.new(params)
    account.save
    assert_not_empty account.users
  end
end
