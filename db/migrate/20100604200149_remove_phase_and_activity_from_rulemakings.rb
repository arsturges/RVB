class RemovePhaseAndActivityFromRulemakings < ActiveRecord::Migration
  def self.up
    remove_column :rulemakings, :phase_id
    remove_column :rulemakings, :activity_id
  end

  def self.down
    add_column :rulemakings, :phase_id, :integer
    add_column :rulemakings, :activity_id, :integer
  end
end
