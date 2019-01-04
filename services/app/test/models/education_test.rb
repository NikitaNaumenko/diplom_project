# frozen_string_literal: true

require 'test_helper'

class EducationTest < ActiveSupport::TestCase
  def setup
    @education = Education.new(code: 'Code', name: 'Name', description: 'Description',
                               account: accounts(:first_account))
  end

  test 'should be valid' do
    assert @education.valid?
  end

  test 'name should be present' do
    @education.name = ' '
    assert_not @education.valid?
  end

  test 'code should be present' do
    @education.code = ' '
    assert_not @education.valid?
  end

  test 'code should be unique in account scope' do
    dup_education = @education.dup
    dup_education.code = @education.code.upcase
    @education.save
    assert_not dup_education.valid?
  end
end
