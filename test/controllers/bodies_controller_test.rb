require 'test_helper'

class BodiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bodies_new_url
    assert_response :success
  end

end
