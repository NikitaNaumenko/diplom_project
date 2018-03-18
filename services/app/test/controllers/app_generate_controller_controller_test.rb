require 'test_helper'

class AppGenerateControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get api/accounts" do
    get app_generate_controller_api/accounts_url
    assert_response :success
  end

end
