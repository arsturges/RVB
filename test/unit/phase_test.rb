require 'test_helper'

class PhaseTest < ActiveSupport::TestCase
  test "should abide by validations" do
    p = Factory.build(:phase, :phase=>"phase1")
    assert p.save

    q = Factory.build(:phase, :phase=>"phase1")
    assert !q.save
  end

  test "should't allow nil fields" do
    r = Factory.build(:phase, :phase=>nil)
    assert !r.save
  end
end
