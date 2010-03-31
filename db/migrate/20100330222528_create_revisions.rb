class CreateRevisions < ActiveRecord::Migration
  def self.up
    create_table :revisions do |t|
      t.integer :revision_number
      t.date :revision_date

      t.timestamps
    end
  end

  def self.down
    drop_table :revisions
  end
end
