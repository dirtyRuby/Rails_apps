require 'test_helper'

class Additional1ControllerTest < ActionController::TestCase
  test "should get view1" do
    get :view1
    assert_response :success
  end

end
