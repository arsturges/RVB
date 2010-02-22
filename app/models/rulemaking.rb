class Rulemaking < ActiveRecord::Base
  validates_presence_of :rule, :rule_type_id, :doe_project_manager_id, :legislative_deadline, :phase_id, :activity_id, :short_name
  validates_numericality_of :rule_type_id, :doe_project_manager_id, :phase_id, :activity_id
  validates_uniqueness_of :short_name

  #foreign keys in table "rulemakings":
  belongs_to :rule_type
  belongs_to :doe_project_manager
  belongs_to :phase
  belongs_to :activity

  #no foreign keys in table "rulemaking"
  has_many :milestones
    
end