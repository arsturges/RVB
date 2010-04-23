class CreateDriversRulemakingsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :drivers_rulemakings, :id => false do |t|
      t.integer :driver_id
      t.integer :rulemaking_id
      t.timestamps
      end
  end

  def self.down
    drop_table :drivers_rulemakings
  end
end
