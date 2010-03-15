class RulemakingsToDateColumn < ActiveRecord::Migration
  def self.up
    change_column(:rulemakings, :legislative_deadline, :date)
  end

  def self.down
    change_column(:rulemakings, :legislative_deadline, :datetime)
  end
end
