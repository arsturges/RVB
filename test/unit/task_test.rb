require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  sort = Factory.next(:integer).to_i

  test "should save new task" do
    a = Task.new( :task=> "some task", :sort => sort  )
    assert a.save, "it failed to save a new task"
  end


  test "shouldn't allow same task and sort" do
    a = Task.new( :task=> "some task", :sort => sort  )
    assert a.save, "it failed to save a proper task"

    b = Task.new( :task=> "some task", :sort => sort+1  )
    assert !b.save, "it saved a task with a duplicate name"

    c = Task.new( :task=> "another task", :sort => sort  )
    assert !c.save, "it saved a task with a duplicate sort"

    d = Task.new( :task=> "some task", :sort => sort  )
    assert !d.save, "it saved a task with a duplicate name and a duplicate sort"
  end

  test "should't save a task with a blank name or sort" do
    c = Task.new(:task => "another task", :sort => nil)
    assert !c.save, "saved a task with a nil sort"

    d = Task.new(:task => nil, :sort =>sort)
    assert !d.save, "saved a task with a nil name"
  end
end
