require 'test_helper'

class OperationAnalysisControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get operation_analysis_show_url
    assert_response :success
  end

end
