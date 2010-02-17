class CreatePhases < ActiveRecord::Migration
  def self.up
    create_table :phases do |t|
      t.string :phase
      t.integer :sort

      t.timestamps
    end
  end

  def self.down
    drop_table :phases
  end
end
