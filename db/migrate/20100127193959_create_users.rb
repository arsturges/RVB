class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :first,                     :string
      t.column :last,                      :string
      t.column :organization,              :string
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      t.column :admin,                     :boolean, :default => 0 #this deault also appears in the user model. Redundant?
      
      
    end
  end

  def self.down
    drop_table "users"
  end
end
