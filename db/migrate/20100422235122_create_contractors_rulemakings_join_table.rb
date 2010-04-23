class CreateContractorsRulemakingsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :contractors_rulemakings, :id => false do |t|
      t.integer :contractor_id
      t.integer :rulemaking_id
    end
  end

  def self.down
    drop_table :contractors_rulemakings
  end
end
