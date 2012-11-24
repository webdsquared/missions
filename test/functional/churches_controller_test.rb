require 'test_helper'

class ChurchesControllerTest < ActionController::TestCase
  setup do
    @church = churches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:churches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create church" do
    assert_difference('Church.count') do
      post :create, church: { city: @church.city, link: @church.link, name: @church.name, state: @church.state }
    end

    assert_redirected_to church_path(assigns(:church))
  end

  test "should show church" do
    get :show, id: @church
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @church
    assert_response :success
  end

  test "should update church" do
    put :update, id: @church, church: { city: @church.city, link: @church.link, name: @church.name, state: @church.state }
    assert_redirected_to church_path(assigns(:church))
  end

  test "should destroy church" do
    assert_difference('Church.count', -1) do
      delete :destroy, id: @church
    end

    assert_redirected_to churches_path
  end
end
