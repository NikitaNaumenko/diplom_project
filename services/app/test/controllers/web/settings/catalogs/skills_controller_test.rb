# frozen_string_literal: true

require 'test_helper'

module Web
  module Settings
    module Catalogs
      class SkillsControllerTest < ActionDispatch::IntegrationTest
        def setup
          @user = users(:first_user)
          @account = accounts(:first_account)
          @user_session = login(@user)
        end

        def create_params
          {
            code: 'newCode',
            name: 'newName',
            description: 'newDescription'
          }
        end

        test 'should response have skills collection' do
          @user_session.get settings_catalogs_skills_url(subdomain: @account.name), as: :json
          assert_not_empty JSON.parse(@user_session.response.body)['skills']
          assert_includes JSON.parse(@user_session.response.body)['skills'], JSON.parse(skills(:sql).to_json)
          assert_includes JSON.parse(@user_session.response.body)['skills'], JSON.parse(skills(:ruby).to_json)
        end

        test 'should change skills count' do
          assert_difference('@account.skills.count') do
            @user_session.post settings_catalogs_skills_url(subdomain: @account.name, params: create_params),
                               as: :json
          end
        end
      end
    end
  end
end
