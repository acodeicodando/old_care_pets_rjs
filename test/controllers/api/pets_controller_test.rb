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
    assert assigns(:pet).valid?
  end

  test "create pet with error" do
    post api_pets_path
    assert_response 422
    assert assigns(:pet).invalid?
  end

  test "edit pet with success" do
    put api_pet_path(@akira), params: { name: 'Akira Edited', date_of_birth: '2001-01-02', pet_type: 'dog' }
    assert_response :success
    assert assigns(:pet).valid?
    assert_equal assigns(:pet).name, 'Akira Edited'
  end

  test "edit pet with error" do
    put api_pet_path(@akira), params: { name: '' }
    assert_response 422
    assert assigns(:pet).invalid?
  end
end
