class Contractor < ActiveRecord::Base
  validates_presence_of :contractor, :abbreviation
  validates_uniqueness_of :contractor, :abbreviation
  has_and_belongs_to_many :rulemakings
end
