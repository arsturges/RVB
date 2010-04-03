require 'test_helper'

class RevisionsControllerTest < ActionController::TestCase

  def setup
    login
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:revisions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  rev = Factory(:revision)

  test "should create revision" do
    assert_difference('Revision.count') do
      post :create, :revision => { :revision_number => 2356, :revision_date => "2010-03-15" }
    end
    assert_redirected_to revision_path(assigns(:revision))
  end

  test "should show revision" do
    get :show, :id => rev.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rev.id
    assert_response :success
  end

  test "should update revision" do
    put :update, :id => rev.id, :revision => {:revision_number => 2497, :revision_date => "2010-01-02" }
    assert_redirected_to revision_path(assigns(:revision))
  end

  test "should destroy revision" do
    assert_difference('Revision.count', -1) do
      delete :destroy, :id => rev.id
    end

    assert_redirected_to revisions_path
  end
end
