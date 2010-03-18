require 'test_helper'

class DateCategoriesControllerTest < ActionController::TestCase
  def setup
    login
  end

      d = Factory(:date_category)


  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:date_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create date_category" do
    assert_difference('DateCategory.count') do
    post :create, :date_category => { :date_category =>  "new date category" }
    end

    assert_redirected_to date_category_path(assigns(:date_category))
  end

  test "should show date_category" do
    get :show, :id => d.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => d.id
    assert_response :success
  end

  test "should update date_category" do
    put :update, :id => d.id, :date_category => {:date_category => "an updated date category"}
    assert_redirected_to date_category_path(assigns(:date_category))
  end

  test "should destroy date_category" do
    assert_difference('DateCategory.count', -1) do
      delete :destroy, :id => d.id
    end

    assert_redirected_to date_categories_path
  end
end
