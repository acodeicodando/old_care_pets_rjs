require 'test_helper'

class Api::PetsControllerTest < ActionDispatch::IntegrationTest
  test "get index" do
    get api_pets_path
    assert_response :success
    assert_equal assigns(:pets).count, 4
  end

  test "get root" do
    get root_path
    assert_response :success
    assert_equal assigns(:pets).count, 4
  end
end
