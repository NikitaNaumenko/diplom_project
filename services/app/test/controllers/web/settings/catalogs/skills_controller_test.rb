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

        def wrong_create_params
          {
            name: 'wrongName'
          }
        end

        test 'should response have skills collection' do
          @user_session.get settings_catalogs_skills_url(subdomain: @account.name), as: :json
          assert_not_empty JSON.parse(@user_session.response.body)['skills']
          assert_includes JSON.parse(@user_session.response.body)['skills'], JSON.parse(skills(:sql).to_json)
          assert_includes JSON.parse(@user_session.response.body)['skills'], JSON.parse(skills(:ruby).to_json)
        end

        test 'should change skills count after create' do
          assert_difference('@account.skills.count') do
            @user_session.post settings_catalogs_skills_url(subdomain: @account.name,
                                                            params: { skill: create_params }),
                               as: :json
          end
        end

        test 'should response have right redirect path after create' do
          @user_session.post settings_catalogs_skills_url(subdomain: @account.name,
                                                          params: { skill: create_params }),
                             as: :json

          assert_equal settings_catalogs_skills_path, JSON.parse(@user_session.response.body)['redirect_path']
        end

        test 'should response have errors and right redirect path after wrong create' do
          @user_session.post settings_catalogs_skills_url(subdomain: @account.name,
                                                          params: { skill: wrong_create_params }),
                             as: :json
          assert_equal new_settings_catalogs_skill_path,
                       JSON.parse(@user_session.response.body)['redirect_path']
          assert_not_empty JSON.parse(@user_session.response.body)['errors']
        end

        test 'should response new be success' do
          @user_session.get new_settings_catalogs_skill_path(subdomain: @account.name)
          @response = @user_session.response
          assert_response :success
        end
      end
    end
  end
end
