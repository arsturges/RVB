require File.dirname(__FILE__) + '/../test_helper'

class RulemakingsControllerTest < ActionController::TestCase
  def setup
    login
  end

  r = Factory(:rulemaking)

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
    get :show, :id => r.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => r.id
    assert_response :success
  end

  test "should update rulemaking" do
    put :update, :id => r.id, :rulemaking => {:rule=>"mWO rulemaking updated", :rule_type_id=>3, :doe_project_manager_id=>1, :legislative_deadline=>"2012-09-02", :activity_id=>4, :phase_id=>1, :short_name=>"shorter name" }
    assert_redirected_to rulemaking_path(assigns(:rulemaking))
  end

  test "should destroy rulemaking" do
    assert_difference('Rulemaking.count', -1) do
      delete :destroy, :id => r.id
    end

    assert_redirected_to rulemakings_path
  end

  test "should get assigned products page" do
    get :assign_products, :id => r.id
    assert_response :success
  end

  p = Factory(:product)

  test "should assign products to rulemaking" do
    # I don't know how to do this: product = Product.new, :product => {:product "new product", :sector_id => 2}
    assert_nil(p.rulemaking)
    post :save_products, :id => r.id, :products => [p.id]
    assert_redirected_to :action => :show
    assert_equal Product.find(p.id).rulemaking, r
  end

  test "should remove product assignment from rulemaking" do
    assert_equal p.rulemaking, r
    post :save_products, :id => r.id, :products => [p.id]
    assert_redirected_to :action => :show
     assert_nil(Product.find(p.id).rulemaking)
  end
end
