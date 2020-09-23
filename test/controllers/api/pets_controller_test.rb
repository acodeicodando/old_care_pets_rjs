require 'test_helper'

class Api::PetsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @akira        = pets(:akira)
    @funny_cat    = pets(:funny_cat)
    @new_pet      = Pet.new
  end

  test "get root" do
    get root_path
    assert_response :success
    assert_equal assigns(:pets).count, 4
  end

  test "get index" do
    get api_pets_path
    assert_response :success
    assert_equal assigns(:pets).count, 4
  end

  test "get info about akira pet" do
    get api_pet_path(@akira)
    assert_response :success
    assert_not_nil assigns(:pet)
  end

  test "create pet with success" do
    post api_pets_path, params: { name: 'Nina', date_of_birth: '2001-01-01', pet_type: 'cat' }
    assert_response :success
    assert_not_nil assigns(:pet)
  end

  test "create pet with error" do
    post api_pets_path
    assert_response 422
    assert_not_nil assigns(:pet)
  end
end
