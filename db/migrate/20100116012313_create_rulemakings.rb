class CreateRulemakings < ActiveRecord::Migration
  def self.up
    create_table :rulemakings do |t|
      t.string :rule
      t.integer :rule_type_id
      t.text :notes
      t.integer :doe_project_manager_id
      t.date :legislative_deadline
      t.integer :phase_id
      t.integer :activity_id
      t.string :short_name

      t.timestamps
    end
  end

  def self.down
    drop_table :rulemakings
  end
end
