require 'test_helper'

class MilestoneTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "shouldn't allow blanks" do
    a=Milestone.create(:rulemaking_id=>30, :phase_id=>2, :activity_id=>4, :date_category_id=>3, :milestone=>Date.today, :revision_number => 1)
    b=Milestone.create(:rulemaking_id=>30, :phase_id=>2, :activity_id=>4, :date_category_id=>4, :milestone=>Date.today, :revision_number => 1)
    c=Milestone.create(:rulemaking_id=>30, :phase_id=>2, :activity_id=>4, :date_category_id=>5, :milestone=>Date.today, :revision_number => 1)

    b.date_category_id = 3
    assert !b.save
    assert_equal(1, b.errors.length)

    a.rulemaking_id=""
    assert !a.save

    a.rulemaking_id=30
    a.phase_id=""
    assert !a.save

    a.phase_id=3
    a.activity_id=""
    assert !a.save

    a.activity_id=3
    a.date_category_id=""
    assert !a.save

    a.date_category_id=6
    a.milestone=""
    assert !a.save
    a.milestone="1999-09-10"
    assert a.save

    a.milestone="1999"
    assert !a.save

    a.milestone="01-01-2002"
    assert a.save

    a.milestone="a text string"
    assert !a.save

  end
end
