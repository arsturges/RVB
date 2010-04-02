class Revision < ActiveRecord::Base
  validates_presence_of :revision_number, :revision_date
  validates_numericality_of :revision_number
  validates_uniqueness_of :revision_number

  has_many :milestones
end
