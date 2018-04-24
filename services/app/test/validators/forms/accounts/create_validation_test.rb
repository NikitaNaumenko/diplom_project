require 'test_helper'

class Forms::AccountsCreateValidationTest < ActiveSupport::TestCase
  test '.success' do
    permitted_attributes = { name: 'name',
                             email: 'email@email.ru',
                             phone: '12345678',
                             registred_user_name: 'name' }
    assert Forms::Accounts::CreateValidation.call(permitted_attributes).success?
  end

  test '.failure without name' do
    permitted_attributes = { email: 'email@email.ru',
                             phone: '12345678',
                             registred_user_name: 'name' }

    validation = Forms::Accounts::CreateValidation.call(permitted_attributes)
    assert_not validation.success?
  end

  test '.failure without email' do
    permitted_attributes = { name: 'name',
                             phone: '12345678',
                             registred_user_name: 'name' }

    validation = Forms::Accounts::CreateValidation.call(permitted_attributes)
    assert_not validation.success?
  end

  test '.failure with wrong format email' do
    permitted_attributes = { name: 'name',
                             phone: '12345678',
                             registred_user_name: 'name' }
    validation = Forms::Accounts::CreateValidation.call(permitted_attributes)
    assert_not validation.success?
  end

  test '.failure without phone' do
    permitted_attributes = { name: 'name',
                             email: 'email@email.ru',
                             registred_user_name: 'name' }

    validation = Forms::Accounts::CreateValidation.call(permitted_attributes)
    assert_not validation.success?
  end

  test '.failure without registred_user_name' do
    permitted_attributes = { name: 'name',
                             email: 'email@email.ru',
                             phone: '12345678' }

    validation = Forms::Accounts::CreateValidation.call(permitted_attributes)
    assert_not validation.success?
  end
end
