# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100224201634) do

  create_table "activities", :force => true do |t|
    t.string   "activity"
    t.string   "activity_abbreviation"
    t.integer  "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "date_categories", :force => true do |t|
    t.string "date_category"
  end

  create_table "doe_project_managers", :force => true do |t|
    t.string   "project_manager"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drivers", :force => true do |t|
    t.string   "driver"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", :force => true do |t|
    t.integer  "rulemaking_id"
    t.integer  "phase_id"
    t.integer  "activity_id"
    t.integer  "date_category_id"
    t.datetime "milestone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phases", :force => true do |t|
    t.string   "phase"
    t.integer  "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rule_types", :force => true do |t|
    t.string   "rule_type"
    t.string   "rule_type_abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rulemakings", :force => true do |t|
    t.string   "rule"
    t.integer  "rule_type_id"
    t.text     "notes"
    t.integer  "doe_project_manager_id"
    t.datetime "legislative_deadline"
    t.integer  "phase_id"
    t.integer  "activity_id"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "organization"
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean  "admin"
  end

end
