class Milestone < ActiveRecord::Base
  validates_presence_of :rulemaking_id, :phase_id, :activity_id, :date_category_id, :milestone, :revision
  validates_numericality_of :rulemaking_id, :phase_id, :activity_id, :date_category_id, :revision
  validates_uniqueness_of :revision, :scope => [:rulemaking_id, :phase_id, :activity_id, :date_category_id], :message => "This date field already exists. Edit the existing date instead of creating a duplicate."

  belongs_to :rulemaking
  belongs_to :phase
  belongs_to :activity
  belongs_to :date_category
  belongs_to :revision

  named_scope :ascend_by_short_name, :order => "rulemakings.short_name", :include => :rulemaking
  named_scope :descend_by_short_name, :order => "rulemakings.short_name desc", :include => :rulemaking

  named_scope :ascend_by_phase, :order => "phases.phase", :include => :phase
  named_scope :descend_by_phase, :order => "phases.phase desc", :include => :phase

  named_scope :ascend_by_activity, :order => "activities.activity", :include => {:rulemaking => :activity}
  named_scope :descend_by_activity, :order => "activities.activity desc", :include =>  {:rulemaking => :activity}

  named_scope :ascend_by_date_category, :order => "date_categories.date_category", :include => :date_category
  named_scope :descend_by_date_category, :order => "date_categories.date_category desc", :include => :date_category

  named_scope :ascend_by_milestone_phase, :order => "milestones.phase_id"
  named_scope :descend_by_milestone_phase, :order => "milestones.phase_id desc"

  named_scope :ascend_by_milestone_activity, :order => "activities.activity", :include => :activity
  named_scope :descend_by_milestone_activity, :order => "activities.activity desc", :include => :activity
  
end
