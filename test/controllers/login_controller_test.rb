require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get controller" do
    get login_controller_url
    assert_response :success
  end

end
