class MilestoneToDateFormat < ActiveRecord::Migration
  def self.up
    change_column(:milestones, :milestone, :date)
  end

  def self.down
    change_column(:milestones, :milestone, :datetime)
  end
end
