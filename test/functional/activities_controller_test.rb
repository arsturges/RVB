require 'test_helper'

class ActivitiesControllerTest < ActionController::TestCase
def setup
    login
  end


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
    activity = Factory(:activity)
    get :edit, :id => activity.id
    assert_response :success
  end

  test "should update activity" do
    activity = Factory(:activity)
    put :update, :id => activity.id, :activity => {:activity=>activity.activity, :activity_abbreviation=>activity.activity_abbreviation, :sort=>activity.sort }
    assert_redirected_to activity_path(assigns(:activity))
  end

  test "should destroy activity" do
    activity = Factory(:activity)
    assert_difference('Activity.count', -1) do
      delete :destroy, :id => activity.id
    end

    assert_redirected_to activities_path
  end
end