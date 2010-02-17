class Driver < ActiveRecord::Base
  validates_presence_of :driver
  validates_uniqueness_of :driver
end
