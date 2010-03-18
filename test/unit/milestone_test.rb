require 'test_helper'

class MilestoneTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "shouldn't allow blanks" do
    a=Factory.build(:milestone, :rulemaking_id=>30, :phase_id=>2, :activity_id=>4, :date_category_id=>3, :milestone=>"2024-01-04")
    b=Factory.build(:milestone, :rulemaking_id=>30, :phase_id=>2, :activity_id=>4, :date_category_id=>4, :milestone=>"2024-01-04")
    c=Factory.build(:milestone, :rulemaking_id=>30, :phase_id=>2, :activity_id=>4, :date_category_id=>5, :milestone=>"2024-01-04")
    
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

    a.milestone="01-01-2002"
    assert a.save

    a.milestone="a text string"
    assert !a.save

  end
end
