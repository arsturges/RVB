class AddIndexesToMilestonesTable < ActiveRecord::Migration
  def self.up
    add_index :milestones, :rulemaking_id
    add_index :milestones, :revision_number
    add_index :milestones, :activity_id
    add_index :milestones, :phase_id
    add_index :milestones, :date_category_id
  end

  def self.down
    remove_index :milestones, :rulemaking_id
    remove_index :milestones, :revision_number
    remove_index :milestones, :activity_id
    remove_index :milestones, :phase_id
    remove_index :milestones, :date_category_id
  end
end
