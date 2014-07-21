require 'test_helper'

class CurrentunitsControllerTest < ActionController::TestCase
  setup do
    @currentunit = currentunits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:currentunits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create currentunit" do
    assert_difference('Currentunit.count') do
      post :create, currentunit: {  }
    end

    assert_redirected_to currentunit_path(assigns(:currentunit))
  end

  test "should show currentunit" do
    get :show, id: @currentunit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @currentunit
    assert_response :success
  end

  test "should update currentunit" do
    patch :update, id: @currentunit, currentunit: {  }
    assert_redirected_to currentunit_path(assigns(:currentunit))
  end

  test "should destroy currentunit" do
    assert_difference('Currentunit.count', -1) do
      delete :destroy, id: @currentunit
    end

    assert_redirected_to currentunits_path
  end
end
