require 'test_helper'

class PhasesControllerTest < ActionController::TestCase
  def setup
    login
  end

  p=Factory(:phase)

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phase" do
    assert_difference('Phase.count') do
      post :create, :phase => {:phase=>"6. fake phase", :sort=>Factory.next(:integer) }
    end

    assert_redirected_to phase_path(assigns(:phase))
  end

  test "should show phase" do
    get :show, :id => p.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => p.id
    assert_response :success
  end

  test "should update phase" do
    put :update, :id => p.id, :phase => {:phase=>"updated phase title", :sort=>2}
    assert_redirected_to phase_path(assigns(:phase))
  end

  test "should destroy phase" do
    assert_difference('Phase.count', -1) do
      delete :destroy, :id => p.id
    end

    assert_redirected_to phases_path
  end
end
