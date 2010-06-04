class Task < ActiveRecord::Base

  validates_presence_of :task, :sort
  validates_uniqueness_of :task, :sort
  validates_numericality_of :sort

  has_many :milestones
end
