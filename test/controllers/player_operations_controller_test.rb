require 'test_helper'

class PlayerOperationsControllerTest < ActionDispatch::IntegrationTest
  test "should get submit" do
    get player_operations_submit_url
    assert_response :success
  end

end
