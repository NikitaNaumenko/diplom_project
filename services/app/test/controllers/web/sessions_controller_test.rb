# frozen_string_literal: true

require 'test_helper'

module Web
  class SessionsControllerTest < ActionDispatch::IntegrationTest
    test 'should response have right redirect path after login' do
      user = users(:first_user)
      open_session do |sess|
        sess.post sessions_url(params: { email: user.email, password: '1234' }, subdomain: user.account.name)
        assert_equal '/', JSON.parse(sess.response.body)['redirect_path']
      end
    end

    test 'should response have right redirect path after wrong login' do
      user = users(:first_user)
      open_session do |sess|
        sess.post sessions_url(params: { email: user.email, password: 'wrong' }, subdomain: user.account.name)
        assert_equal '/login', JSON.parse(sess.response.body)['redirect_path']
      end
    end

    test 'should response have right redirect path after logout' do
      user = users(:first_user)
      user_session = login(user)
      user_session.delete logout_url
      @response = user_session.response
      assert_response :redirect
      assert_equal root_url, user_session.response.redirect_url
    end
  end
end
