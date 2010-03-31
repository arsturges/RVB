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
  has_many :products

  named_scope :ascend_by_rule_type, :order => "rule_types.rule_type"
  named_scope :descend_by_rule_type, :order => "rule_types.rule_type desc"

  named_scope :ascend_by_activity, :order => "activities.activity"
  named_scope :descend_by_activity, :order => "activities.activity desc"

  named_scope :ascend_by_doe_project_manager, :order => "doe_project_managers.project_manager"
  named_scope :descend_by_doe_project_manager, :order => "doe_project_managers.project_manager desc"

  named_scope :ascend_by_phase, :order => "phases.phase"
  named_scope :descend_by_phase, :order => "phases.phase desc"

  named_scope :ascend_by_activity, :order => "activities.activity"
  named_scope :descend_by_activity, :order => "activities.activity desc"



# default_scope :order => "short_name"
end
