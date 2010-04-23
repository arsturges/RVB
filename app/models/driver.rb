class Driver < ActiveRecord::Base
  validates_presence_of :driver
  validates_uniqueness_of :driver

  has_and_belongs_to_many :rulemakings
end
