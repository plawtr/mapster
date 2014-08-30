require 'test_helper'

class IncidentsControllerTest < ActionController::TestCase
  test "should get report" do
    get :report
    assert_response :success
  end

  test "should get heatmap" do
    get :heatmap
    assert_response :success
  end

end
