class RenameActivityToTask < ActiveRecord::Migration
  def self.up
    rename_table :activities, :tasks
    rename_column :tasks, :activity, :task
    rename_column :tasks, :activity_abbreviation, :task_abbreviation

    rename_column :milestones, :activity_id, :task_id
  end

  def self.down
    rename_table :tasks, :activities
    rename_column :activities, :task, :activity
    rename_column :activities, :task_abbreviation, :activity_abbreviation

    rename_column :milestones, :task_id, :activity_id
  end
end
