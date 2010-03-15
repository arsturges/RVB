require 'test_helper'

class RuleTypesControllerTest < ActionController::TestCase
  def setup
    login
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rule_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rule_type" do
    assert_difference('RuleType.count') do
      post :create, :rule_type => {:rule_type=>"Standard1", :rule_type_abbreviation=>"STD1"}
    end

    assert_redirected_to rule_type_path(assigns(:rule_type))
  end

  test "should show rule_type" do
    get :show, :id => rule_types(:standard).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rule_types(:standard).to_param
    assert_response :success
  end

  test "should update rule_type" do
    put :update, :id => rule_types(:standard).to_param, :rule_type => {:rule_type=>"updated rule type", :rule_type_abbreviation=>"abbrevi" }
    assert_redirected_to rule_type_path(assigns(:rule_type))
  end

  test "should destroy rule_type" do
    assert_difference('RuleType.count', -1) do
      delete :destroy, :id => rule_types(:standard).to_param
    end

    assert_redirected_to rule_types_path
  end
end
