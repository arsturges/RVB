require 'test_helper'

class RulemakingTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  test "should save new valid rulemaking" do
    r = Factory.build(:rulemaking)
    assert r.save, "failed to save a valid rulemaking"
    assert_equal (1, Rulemaking.count, "there should be 1 rulemaking")
  end

  test "rulemaking should not save with empty fields" do
    r = Rulemaking.new
    assert !r.save, "Saved the rulemaking without anything"

    r.rule = "Microwave Ovens"
    assert !r.save, "Saved with only title"

    r.rule_type_id = 1
    assert !r.save, "Saved with only title and rulemaking_type_id"

    r.legislative_deadline = "2010-01-01"
    assert !r.save, "saved with only title, type_id, and leg. deadline"

    r.doe_project_manager_id=4
    assert !r.save, "saved with missing fields"

    r.short_name = "MWO STD short title"
    assert r.save, "failed to save a valid rulemaking"
  end

  test "rulemaking should not save with non-numeric foreign keys" do
    r = Rulemaking.new

    r.doe_project_manager_id="Charles"
    r.save
    assert !r.save, "saved rulemaking with string for project_manager_id"

    r.rule_type_id = "one"
    r.save
    assert !r.save, "saved with string in numeric field rulemaking"

    r.doe_project_manager_id=3
    r.rule_type_id=2
    r.rule="text"
    r.legislative_deadline="2010-02-04"
    r.short_name="text"
    assert r.save, "failed to save valid rulemaking"
  end

  test "rulemaking should not save duplicate short name" do
    
    t = Factory(:rulemaking)

    t.short_name="test short name"
    assert t.save, "failed to save a valid rulemaking"

    u = Factory(:rulemaking)
    u.short_name="test short name"
    assert !u.save, "saved a rulemaking with a duplicate short_name"
  end
end
