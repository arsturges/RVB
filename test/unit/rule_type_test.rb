require 'test_helper'

class RuleTypeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should abide by validations" do
    r=RuleType.new(:rule_type=>"", :rule_type_abbreviation=>"")
    assert !r.save
    r.rule_type="new rule type"
    assert !r.save
    r.rule_type_abbreviation="abbreviation"
    assert r.save

    s=RuleType.new(:rule_type=>"new rule type", :rule_type_abbreviation=>"abbreviation")
    assert !s.save
    s.rule_type="a unique rule type"
    assert !s.save
    s.rule_type_abbreviation="unique abbreviation"
    assert s.save
  end
end
