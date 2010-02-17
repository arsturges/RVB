class RuleType < ActiveRecord::Base
  validates_presence_of :rule_type, :rule_type_abbreviation
  validates_uniqueness_of :rule_type, :rule_type_abbreviation

  has_many :rulemakings
end
