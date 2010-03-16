class CreateMilestones < ActiveRecord::Migration
  def self.up
    create_table :milestones do |t|
      t.integer :rulemaking_id
      t.integer :phase_id
      t.integer :activity_id
      t.integer :date_category_id
      t.date :milestone

      t.timestamps
    end
  end

  def self.down
    drop_table :milestones
  end
end
