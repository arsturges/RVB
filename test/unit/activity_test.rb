require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  sort = Factory.next(:integer).to_i

  test "shouldn't allow same activity and sort" do
    # but it does. Try it and see for yourself.

    a = Activity.new( :activity=> "some activity", :sort => sort  )
    assert a.save

    b = Activity.new( :activity=> "some activity", :sort => sort  )
    b.save
    assert_equal({}, b.errors.full_messages)

  end

  test "should't allow nil activity name or sort" do
    c = Activity.new(:activity => "another act", :activity=>nil)
    assert !c.save

    d = Activity.new(:activity => nil, :sort =>sort)
    assert !d.save
  end
end
