require 'test_helper'

class DriversControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create driver" do
    assert_difference('Driver.count') do
      post :create, :driver => {:driver=>"new driver" }
    end

    assert_redirected_to driver_path(assigns(:driver))
  end

  test "should show driver" do
    get :show, :id => drivers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => drivers(:one).to_param
    assert_response :success
  end

  test "should update driver" do
    put :update, :id => drivers(:one).to_param, :driver => {:driver=>"updated driver" }
    assert_redirected_to driver_path(assigns(:driver))
  end

  test "should destroy driver" do
    assert_difference('Driver.count', -1) do
      delete :destroy, :id => drivers(:one).to_param
    end

    assert_redirected_to drivers_path
  end
end
