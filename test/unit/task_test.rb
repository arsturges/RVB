require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  sort = Factory.next(:integer).to_i

  test "shouldn't allow same task and sort" do
    # but it does. Try it and see for yourself.

    a = Task.new( :task=> "some task", :sort => sort  )
    assert a.save

    b = Task.new( :task=> "some task", :sort => sort  )
    b.save
    assert_equal({}, b.errors.full_messages)

  end

  test "should't allow nil task name or sort" do
    c = Task.new(:task => "another task", :task => nil)
    assert !c.save

    d = Task.new(:task => nil, :sort =>sort)
    assert !d.save
  end
end
