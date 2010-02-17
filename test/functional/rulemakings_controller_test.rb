require 'test_helper'

class RulemakingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rulemakings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rulemaking" do
    assert_difference('Rulemaking.count') do
      post :create, :rulemaking => {:rule=>"mWO rulemaking", :rule_type_id=>2, :doe_project_manager_id=>4, :legislative_deadline=>"2022-09-02", :activity_id=>4, :phase_id=>2, :short_name=>"short name" }
    end

    assert_redirected_to rulemaking_path(assigns(:rulemaking))
  end

  test "should show rulemaking" do
    get :show, :id => rulemakings(:aham1).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rulemakings(:aham1).to_param
    assert_response :success
  end

  test "should update rulemaking" do
    put :update, :id => rulemakings(:aham1).to_param, :rulemaking => {:rule=>"mWO rulemaking updated", :rule_type_id=>3, :doe_project_manager_id=>4, :legislative_deadline=>"2022-09-02", :activity_id=>4, :phase_id=>2, :short_name=>"shorter name" }
    assert_redirected_to rulemaking_path(assigns(:rulemaking))
  end

  test "should destroy rulemaking" do
    assert_difference('Rulemaking.count', -1) do
      delete :destroy, :id => rulemakings(:aham1).to_param
    end

    assert_redirected_to rulemakings_path
  end
end
