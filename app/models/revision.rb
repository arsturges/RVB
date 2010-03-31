class Revision < ActiveRecord::Base
  has_many :milestones
  validates_presence_of :revision_number, :revision_date
  validates_numericality_of :revision_number
  validates_uniqueness_of :revision_number
end
