require 'test_helper'

class PhaseTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should abide by validations" do
    p=Phase.new
    p.phase=""
    assert !p.save
    p.phase="anew phase"
    assert !p.save
    p.sort=5
    assert p.save

    q=Phase.new
    q.phase="anew phase"
    q.sort=7
    assert !q.save

    q.phase="unique phase name"
    assert q.save
  end
end
