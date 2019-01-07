# frozen_string_literal: true

require 'test_helper'

module Web
  module Settings
    module Catalogs
      class MoiKrugsControllerTest < ActionDispatch::IntegrationTest
        def setup
          @user = users(:first_user)
          @account = accounts(:first_account)
          @user_session = login(@user)
        end

        def create_params
          {
            client_id: '1234',
            client_secret: '1234'
          }
        end

        test 'should response be success in new action' do
          @user_session.get new_settings_integrations_moi_krug_url(subdomain: @account.name)
          @response = @user_session.response
          assert_response :success
        end

        test 'should response be success in index action' do
          @user_session.get settings_integrations_moi_krugs_url(subdomain: @account.name)
          @response = @user_session.response
          assert_response :success
        end

        test 'should response have right redirect path' do
          @user_session.post settings_integrations_moi_krugs_url(subdomain: @account.name,
                                                                 params: { moi_krug: create_params })
          assert_equal settings_integrations_moi_krugs_path,
                       JSON.parse(@user_session.response.body)['redirect_path']
        end
      end
    end
  end
end
