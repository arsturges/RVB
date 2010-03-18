require 'test_helper'

class MilestonesControllerTest < ActionController::TestCase
  def setup
    login
  end

  m = Factory(:milestone)

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:milestones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create milestone" do
    assert_difference('Milestone.count') do
    post :create, :milestone => {:rulemaking_id=>4, :phase_id=>2, :activity_id=>13, :date_category_id=>5, :milestone=>"2011-02-04" }
    end

    assert_redirected_to milestone_path(assigns(:milestone))
  end

  test "should show milestone" do
    get :show, :id => m.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => m.id
    assert_response :success
  end

  test "should update milestone" do
    put :update, :id => m.id, :milestone => {:rulemaking_id=>15, :phase_id=>7, :activity_id=>1, :date_category_id=>2, :milestone=>"2012-02-04" }
    assert_redirected_to milestone_path(assigns(:milestone))
  end

  test "should destroy milestone" do
    assert_difference('Milestone.count', -1) do
      delete :destroy, :id => m.id
    end

    assert_redirected_to milestones_path
  end
end