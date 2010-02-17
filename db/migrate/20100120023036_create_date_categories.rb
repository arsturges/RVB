class CreateDateCategories < ActiveRecord::Migration
  def self.up
    create_table :date_categories do |t|
      t.string :date_category

      t.timestamps
    end
  end

  def self.down
    drop_table :date_categories
  end
end
