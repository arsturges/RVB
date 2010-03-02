class Activity < ActiveRecord::Base

  validates_presence_of :activity, :sort
  validates_uniqueness_of :activity, :sort
  validates_numericality_of :sort

  has_many :rulemakings
  has_many :milestones

  def self.fed_reg_pub
    find_by_activity ("Federal Register Review and Publication")
  end
end
