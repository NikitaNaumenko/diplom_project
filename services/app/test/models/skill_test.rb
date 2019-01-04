# frozen_string_literal: true

require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  def setup
    @skill = Skill.new(code: 'Code', name: 'Name', description: 'Description',
                       account: accounts(:first_account))
  end

  test 'should be valid' do
    assert @skill.valid?
  end

  test 'name should be present' do
    @skill.name = ' '
    assert_not @skill.valid?
  end

  test 'code should be present' do
    @skill.code = ' '
    assert_not @skill.valid?
  end

  test 'code should be unique in account scope' do
    dup_education = @skill.dup
    dup_education.code = @skill.code.upcase
    @skill.save
    assert_not dup_education.valid?
  end
end
