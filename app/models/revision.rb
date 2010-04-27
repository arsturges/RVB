class Revision < ActiveRecord::Base
  validates_presence_of :revision_number, :revision_date
  validates_numericality_of :revision_number
  validates_uniqueness_of :revision_number

  has_many :milestones, :class_name => 'Milestone', :foreign_key => 'revision_number'  #why make the foreign key 'revision number' when it has a field 'revision_id'?
  default_scope :order => "revision_date DESC"
end
