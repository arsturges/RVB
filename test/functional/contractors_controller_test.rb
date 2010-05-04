require 'test_helper'

class ContractorsControllerTest < ActionController::TestCase

  def setup
    login
    @c = Factory(:contractor)
  end

  def teardown
    Contractor.destroy_all
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contractors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contractor" do
    assert_difference('Contractor.count') do
      post :create, :contractor => { :contractor => "New contractor", :abbreviation => "new Contr." }
    end

    assert_redirected_to contractors_path
  end

  test "should show contractor" do
    get :show, :id => @c
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @c
    assert_response :success
  end

  test "should update contractor" do
    put :update, :id => @c, :contractor => { :abbreviation => "shorter" }
    assert_redirected_to contractors_path
  end

  test "should destroy contractor" do
    assert_difference('Contractor.count', -1) do
      delete :destroy, :id => @c
    end

    assert_redirected_to contractors_path
  end
end
