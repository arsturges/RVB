require 'test_helper'

class PhaseTest < ActiveSupport::TestCase
  test "should abide by validations" do
    p = Factory.build(:phase)
    assert p.save

    q = Factory.build(:phase)
    assert !q.save
  end

  test "should't allow nil fields" do
    r = Factory.build(:phase, :phase=>nil)
    assert !r.save
  end
end
