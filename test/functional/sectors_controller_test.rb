require 'test_helper'

class SectorsControllerTest < ActionController::TestCase

  def setup
    login
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sectors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  s = Sector.create(:sector => {:sector => "a new sector again"})

  test "should create sector" do
    assert_difference('Sector.count') do
      post :create, :sector => { :sector=>"a sector." }
  end

    assert_redirected_to sector_path(assigns(:sector))
  end

  test "should show sector" do
    get :show, :id => s.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => s.id
    assert_response :success
  end

  test "should update sector" do
    put :update, :id => s.id, :sector => {:sector => 'new sector name'}
    assert_redirected_to sector_path(assigns(:sector))
  end

  test "should destroy sector" do
    assert_difference('Sector.count', -1) do
      delete :destroy, :id => s.id
    end

    assert_redirected_to sectors_path
  end
end
