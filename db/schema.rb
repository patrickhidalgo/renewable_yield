# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141214223144) do

  create_table "investments", force: true do |t|
    t.integer  "term"
    t.decimal  "interest_rate"
    t.integer  "minimum_order"
    t.integer  "denomination"
    t.date     "maturity_date"
    t.date     "issue_date"
    t.date     "offer_start_period"
    t.date     "offer_end_period"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "investments", ["user_id"], name: "index_investments_on_user_id"

  create_table "projects", force: true do |t|
    t.string   "format"
    t.string   "api_key"
    t.decimal  "system_capacity"
    t.integer  "module_type"
    t.decimal  "losses"
    t.integer  "array_type"
    t.decimal  "tilt"
    t.decimal  "azimuth"
    t.string   "address"
    t.decimal  "lat"
    t.decimal  "lon"
    t.string   "file_id"
    t.string   "dataset"
    t.integer  "radius"
    t.string   "timeframe"
    t.decimal  "dc_ac_ratio"
    t.decimal  "gcr"
    t.decimal  "inv_eff"
    t.string   "callback"
    t.integer  "npv"
    t.decimal  "irr"
    t.integer  "project_score"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "users", force: true do |t|
    t.string   "company_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "email"
    t.integer  "ssn"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.boolean  "verified_email",  default: false
    t.string   "token",           default: ""
  end

end
