require 'test_helper'

class DoeProjectManagersControllerTest < ActionController::TestCase
  def setup
    login
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doe_project_managers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doe_project_manager" do
    assert_difference('DoeProjectManager.count') do
      post :create, :doe_project_manager => {:project_manager=>"new project manager" }
    end

    assert_redirected_to doe_project_manager_path(assigns(:doe_project_manager))
  end

  test "should show doe_project_manager" do
    get :show, :id => doe_project_managers(:bill).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => doe_project_managers(:bill).to_param
    assert_response :success
  end

  test "should update doe_project_manager" do
    put :update, :id => doe_project_managers(:bill).to_param, :doe_project_manager => {:project_manager=>"updated manager" }
    assert_redirected_to doe_project_manager_path(assigns(:doe_project_manager))
  end

  test "should destroy doe_project_manager" do
    assert_difference('DoeProjectManager.count', -1) do
      delete :destroy, :id => doe_project_managers(:bill).to_param
    end

    assert_redirected_to doe_project_managers_path
  end
end
