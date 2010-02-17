class DateCategory < ActiveRecord::Base
  validates_presence_of :date_category
  validates_uniqueness_of :date_category
  has_many :milestones
  
end
