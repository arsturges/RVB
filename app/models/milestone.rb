class Milestone < ActiveRecord::Base
  validates_presence_of :rulemaking_id, :phase_id, :activity_id, :date_category_id, :milestone, :revision_number
  validates_numericality_of :rulemaking_id, :phase_id, :activity_id, :date_category_id, :revision_number
  validates_uniqueness_of :revision_number, :scope => [:rulemaking_id, :phase_id, :activity_id, :date_category_id], :message => "This date field already exists. Edit the existing date instead of creating a duplicate."

  belongs_to :rulemaking
  belongs_to :phase
  belongs_to :activity
  belongs_to :date_category
  belongs_to :revision, :class_name => 'Revision', :foreign_key => 'revision_number', :primary_key => 'revision_number'

  named_scope :ascend_by_short_name, :order => "rulemakings.short_name", :include => :rulemaking
  named_scope :descend_by_short_name, :order => "rulemakings.short_name desc", :include => :rulemaking

  named_scope :ascend_by_rulemaking_phase, :order => "rulemakings.phase_id", :include => :phase
  named_scope :descend_by_rulemaking_phase, :order => "rulemakings.phase_id desc", :include => :phase

  named_scope :ascend_by_activity, :order => "activities.activity", :include => {:rulemaking => :activity}
  named_scope :descend_by_activity, :order => "activities.activity desc", :include =>  {:rulemaking => :activity}

  named_scope :ascend_by_date_category, :order => "date_categories.date_category", :include => :date_category
  named_scope :descend_by_date_category, :order => "date_categories.date_category desc", :include => :date_category

  named_scope :ascend_by_milestone_phase, :order => "milestones.phase_id"
  named_scope :descend_by_milestone_phase, :order => "milestones.phase_id desc"

  named_scope :ascend_by_milestone_activity, :order => "activities.activity", :include => :activity
  named_scope :descend_by_milestone_activity, :order => "activities.activity desc", :include => :activity
  
  named_scope :by_revision, lambda { |rn| {:conditions=> {:revision_number => rn}}}
  
end
