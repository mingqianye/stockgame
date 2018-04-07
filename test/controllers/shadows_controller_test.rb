require 'test_helper'

class ShadowsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shadows_show_url
    assert_response :success
  end

end
