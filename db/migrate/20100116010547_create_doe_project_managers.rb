class CreateDoeProjectManagers < ActiveRecord::Migration
  def self.up
    create_table :doe_project_managers do |t|
      t.string :project_manager

      t.timestamps
    end
  end

  def self.down
    drop_table :doe_project_managers
  end
end
