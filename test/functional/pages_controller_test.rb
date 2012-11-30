require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get links" do
    get :links
    assert_response :success
  end

  test "should get missions" do
    get :missions
    assert_response :success
  end

  test "should get support" do
    get :support
    assert_response :success
  end

end
