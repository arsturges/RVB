class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :product
      t.integer :rulemaking_id

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
