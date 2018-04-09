require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  test "should get upsert" do
    get players_upsert_url
    assert_response :success
  end

end
