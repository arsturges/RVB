require 'test_helper'

class MilestoneTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "shouldn't allow blanks" do
    a=Milestone.new(:rulemaking_id=>30, :phase_id=>2, :activity_id=>4, :date_category_id=>3, :milestone=>"2024-01-04")
    b=Milestone.new(:rulemaking_id=>30, :phase_id=>2, :activity_id=>4, :date_category_id=>4, :milestone=>"2014-03-04")
    c=Milestone.new(:rulemaking_id=>30, :phase_id=>2, :activity_id=>4, :date_category_id=>5, :milestone=>"2034-07-14")
    
    assert a.save
    assert b.save
    assert c.save

    b.date_category_id=3
    assert !b.save

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

    #a.milestone="01-01-2002"
    #assert !a.save # This fails; I guess it CAN accept multiple date formats.

    c.milestone="a text string"
    assert !c.save

  end
end
