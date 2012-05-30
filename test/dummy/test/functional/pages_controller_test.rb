require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get simple_test" do
    get :simple_test
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
