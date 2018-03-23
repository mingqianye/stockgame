require 'test_helper'

class LeaderboardControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get leaderboard_show_url
    assert_response :success
  end

end
