require 'test_helper'

class RulemakingTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "rulemaking should not save with empty fields" do
    r = Rulemaking.new
    assert !r.save, "Saved the rulemaking without anything"

    r.rule = "Microwave Ovens"
    assert !r.save, "Saved with only title"

    r.rule_type_id = 1
    assert !r.save, "Saved with only title and rulemaking_type_id"

    r.legislative_deadline = "2010-01-01"
    assert !r.save, "saved with only title, type_id, and leg. deadline"

    r.phase_id = 2
    assert !r.save, "saved with only title, type_id, deadline, and phase_id"

    r.activity_id = 13
    assert !r.save, "saved with missing fields"

    r.doe_project_manager_id=4
    assert !r.save, "saved with missing fields"

    r.short_name = "MWO STD short title"
    assert r.save
  end

  test "rulemaking should not save with non-numeric foreign keys" do
    r = Rulemaking.new
    r.activity_id = "three"
    assert !r.save, "non-numeric activity_id"

    r.doe_project_manager_id="Charles"
    r.save
    assert !r.save

    r.phase_id="four"
    r.save
    assert !r.save

    r.rule_type_id = "one"
    r.save
    assert !r.save

    r.activity_id =1
    r.doe_project_manager_id=3
    r.phase_id=3
    r.rule_type_id=2
    r.rule="text"
    r.legislative_deadline="2010-02-04"
    r.short_name="text"
    assert r.save

  end

  test "rulemaking should not save duplicate short name" do
    
    r = Rulemaking.new

    r.activity_id =1
    r.doe_project_manager_id=3
    r.phase_id=3
    r.rule_type_id=2
    r.rule="text"
    r.legislative_deadline="2010-02-04"
    r.short_name="text"
    assert r.save

    s = Rulemaking.new
    s.activity_id =2
    s.doe_project_manager_id=3
    s.phase_id=3
    s.rule_type_id=1
    s.rule="more text"
    s.legislative_deadline="2010-02-04"
    s.short_name="text"
    assert !s.save
  end
end