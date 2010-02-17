class Milestone < ActiveRecord::Base
  validates_presence_of :rulemaking_id, :phase_id, :activity_id, :date_category_id, :milestone
  validates_numericality_of :rulemaking_id, :phase_id, :activity_id, :date_category_id
  validates_uniqueness_of :date_category_id, :scope => [:activity_id, :phase_id, :rulemaking_id], :message => "This date field already exists. Edit the existing date instead of creating a duplicate."

  belongs_to :rulemaking
  belongs_to :phase
  belongs_to :activity
  belongs_to :date_category

end
