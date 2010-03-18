class Sector < ActiveRecord::Base
  validates_presence_of :sector
  validates_uniqueness_of :sector

  has_many :products
end
