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

d= Factory(:doe_project_manager)

  test "should create doe_project_manager" do
    assert_difference('DoeProjectManager.count') do
       post :create, :doe_project_manager => { :project_manager =>  "new  project manager" }
       # why can't I replace the line above with d= Factory(:doe_project_manager)?
  end
    assert_redirected_to doe_project_manager_path(assigns(:doe_project_manager))
  end

  test "should show doe_project_manager" do
    get :show, :id => d.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => d.id
    assert_response :success
  end

  test "should update doe_project_manager" do
    put :update, :id => d.id, d.project_manager => {:project_manager=>"updated manager" }
    assert_redirected_to doe_project_manager_path(assigns(:doe_project_manager))
  end

  test "should destroy doe_project_manager" do
    assert_difference('DoeProjectManager.count', -1) do
      delete :destroy, :id => d.id
    end

    assert_redirected_to doe_project_managers_path
  end
end