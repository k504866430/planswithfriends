require 'test_helper'

class SocializePlansControllerTest < ActionController::TestCase
  setup do
    @socialize_plan = socialize_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:socialize_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create socialize_plan" do
    assert_difference('SocializePlan.count') do
      post :create, :socialize_plan => @socialize_plan.attributes
    end

    assert_redirected_to socialize_plan_path(assigns(:socialize_plan))
  end

  test "should show socialize_plan" do
    get :show, :id => @socialize_plan.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @socialize_plan.to_param
    assert_response :success
  end

  test "should update socialize_plan" do
    put :update, :id => @socialize_plan.to_param, :socialize_plan => @socialize_plan.attributes
    assert_redirected_to socialize_plan_path(assigns(:socialize_plan))
  end

  test "should destroy socialize_plan" do
    assert_difference('SocializePlan.count', -1) do
      delete :destroy, :id => @socialize_plan.to_param
    end

    assert_redirected_to socialize_plans_path
  end
end
