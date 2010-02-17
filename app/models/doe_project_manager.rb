class DoeProjectManager < ActiveRecord::Base
  validates_presence_of :project_manager
  validates_uniqueness_of :project_manager

  has_many :rulemakings
end
