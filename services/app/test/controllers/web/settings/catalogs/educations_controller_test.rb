# frozen_string_literal: true

require 'test_helper'

module Web
  module Settings
    module Catalogs
      class EducationsControllerTest < ActionDispatch::IntegrationTest
        def setup
          @user = users(:first_user)
          @account = accounts(:first_account)
          @user_session = login(@user)
        end

        test 'should response have skills collection' do
          @user_session.get settings_catalogs_educations_url(subdomain: @account.name)
          @user_session.assert_response :success
        end

        test 'should change educations count after create' do
          create_params = { name: 'name', code: 'code', description: 'description' }
          assert_difference('@account.educations.count') do
            @user_session.post settings_catalogs_educations_url(subdomain: @account.name,
                                                                params: { education: create_params })
          end
        end

        test 'should response new be success' do
          @user_session.get new_settings_catalogs_education_path(subdomain: @account.name)
          @user_session.assert_response :success
        end
      end
    end
  end
end
