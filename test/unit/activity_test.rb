require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  test "shouldn't save with blank fields" do
    a = Activity.new
    a.activity=""
    assert !a.save
    a.activity_abbreviation=""
    assert !a.save
    a.activity="new activity"
    assert !a.save
    a.activity_abbreviation="abb"
    a.sort=2
    assert a.save

    b=Activity.new
    b.activity="new activity"
    b.activity_abbreviation="abbrev"
    b.sort=2

    assert !b.save
    b.activity="another activity"
    assert !b.save
    b.sort=3
    assert b.save

    b.sort="four"
    assert !b.save
    b.sort=4
    assert b.save
  end
end
