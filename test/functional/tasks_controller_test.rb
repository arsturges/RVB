require 'test_helper'

class TasksControllerTest < ActionController::TestCase
def setup
    login
  end


  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, :task => { :task => "a new task", :task_abbreviation=>"new task abbr.", :sort=>2222 }
    end
    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    task = Factory(:task)
    get :show, :id => task.id
    assert_response :success
  end

  test "should get edit" do
     task = Factory(:task)
    get :edit, :id => task.id
    assert_response :success
  end

  test "should update task" do
     task = Factory(:task)
    put :update, :id => task.id, :task => {:task => task.task, :task_abbreviation=> task.task_abbreviation, :sort=>task.sort }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
     task = Factory(:task)
    assert_difference('Task.count', -1) do
      delete :destroy, :id => task.id
    end

    assert_redirected_to tasks_path
  end
end