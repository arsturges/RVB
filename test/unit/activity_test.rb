require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  test "shouldn't allow same activity and sort" do
    # but it does. Try it and see for yourself.

    a = Factory.build(:activity)
    assert a.save

    b = Factory.build(:activity)
    assert !b.save

  end

  test "should't allow nil activity name or sort" do
    c = Factory.build(:activity, :activity=>nil)
    assert !c.save

    d = Factory.build(:activity, :sort =>nil)
    assert !d.save
  end
end
