require 'test_helper'

class DateCategoriesControllerTest < ActionController::TestCase
  def setup
    login
  end

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
    d = Factory(:date_category)
    assert_difference('DateCategory.count') do
      post :create, :date_category => { :date_category =>  d.date_category }
    end

    assert_redirected_to date_category_path(assigns(:date_category))
  end

  test "should show date_category" do
    d = Factory(:date_category)
    get :show, :id => d.id
    assert_response :success
  end

  test "should get edit" do
    d = Factory(:date_category)
    get :edit, :id => d.id
    assert_response :success
  end

  test "should update date_category" do
    e = Factory(:date_category)
    put :update, :id => e.id, :date_category => {:date_category => e.date_category}
    assert_redirected_to date_category_path(assigns(:date_category))
  end

  test "should destroy date_category" do
    d = Factory(:date_category)
    assert_difference('DateCategory.count', -1) do
      delete :destroy, :id => d.id
    end

    assert_redirected_to date_categories_path
  end
end
