require 'test_helper'

class ManagerInspectionsControllerTest < ActionController::TestCase
  setup do
    @manager_inspection = manager_inspections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manager_inspections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manager_inspection" do
    assert_difference('ManagerInspection.count') do
      post :create, manager_inspection: { appliances: @manager_inspection.appliances, components: @manager_inspection.components, flooring: @manager_inspection.flooring, new_countertop: @manager_inspection.new_countertop, paint: @manager_inspection.paint, property: @manager_inspection.property, rent_ready: @manager_inspection.rent_ready, unit_number: @manager_inspection.unit_number }
    end

    assert_redirected_to manager_inspection_path(assigns(:manager_inspection))
  end

  test "should show manager_inspection" do
    get :show, id: @manager_inspection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manager_inspection
    assert_response :success
  end

  test "should update manager_inspection" do
    patch :update, id: @manager_inspection, manager_inspection: { appliances: @manager_inspection.appliances, components: @manager_inspection.components, flooring: @manager_inspection.flooring, new_countertop: @manager_inspection.new_countertop, paint: @manager_inspection.paint, property: @manager_inspection.property, rent_ready: @manager_inspection.rent_ready, unit_number: @manager_inspection.unit_number }
    assert_redirected_to manager_inspection_path(assigns(:manager_inspection))
  end

  test "should destroy manager_inspection" do
    assert_difference('ManagerInspection.count', -1) do
      delete :destroy, id: @manager_inspection
    end

    assert_redirected_to manager_inspections_path
  end
end
