require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase



  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post :create, :activity => {:activity=>"a new activity", :activity_abbreviation=>"new activ. abbr.", :sort=>2 }
    end

    assert_redirected_to activity_path(assigns(:activity))
  end



  test "should show activity" do
    activity = Factory(:activity)
    get :show, :id => activity.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => activities(:omb_review).to_param
    assert_response :success
  end

  test "should update activity" do
    put :update, :id => activities(:omb_review).to_param, :activity => {:activity=>"updated activity", :activity_abbreviation=>"updated abbrev.", :sort=>2 }
    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete :destroy, :id => activities(:omb_review).to_param
    end

    assert_redirected_to activities_path
  end
end
