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

ActiveRecord::Schema.define(:version => 20100604200149) do

  create_table "activities", :force => true do |t|
    t.string   "activity"
    t.string   "activity_abbreviation"
    t.integer  "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.date     "birth"
    t.date     "death"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contractors", :force => true do |t|
    t.string   "contractor"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contractors_rulemakings", :id => false, :force => true do |t|
    t.integer "contractor_id"
    t.integer "rulemaking_id"
  end

  create_table "date_categories", :force => true do |t|
    t.string   "date_category"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "drivers_rulemakings", :id => false, :force => true do |t|
    t.integer  "driver_id"
    t.integer  "rulemaking_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", :force => true do |t|
    t.integer  "rulemaking_id"
    t.integer  "phase_id"
    t.integer  "activity_id"
    t.integer  "date_category_id"
    t.date     "milestone"
    t.integer  "revision_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "milestones", ["activity_id"], :name => "index_milestones_on_activity_id"
  add_index "milestones", ["date_category_id"], :name => "index_milestones_on_date_category_id"
  add_index "milestones", ["phase_id"], :name => "index_milestones_on_phase_id"
  add_index "milestones", ["revision_number"], :name => "index_milestones_on_revision_number"
  add_index "milestones", ["rulemaking_id"], :name => "index_milestones_on_rulemaking_id"

  create_table "phases", :force => true do |t|
    t.string   "phase"
    t.integer  "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "product"
    t.integer  "sector_id"
    t.integer  "rulemaking_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "revisions", :force => true do |t|
    t.integer  "revision_number"
    t.date     "revision_date"
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
    t.date     "legislative_deadline"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", :force => true do |t|
    t.string   "sector"
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
    t.boolean  "admin",                                   :default => false, :null => false
  end

end
