require 'test_helper'

class TicksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get ticks_show_url
    assert_response :success
  end

end
