class Phase < ActiveRecord::Base
  validates_presence_of :phase, :sort
  validates_numericality_of :sort
  validates_uniqueness_of :phase, :sort

  has_many :rulemakings
  has_many :milestones
end
