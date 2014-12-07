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

ActiveRecord::Schema.define(version: 20141207033117) do

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
  end

  create_table "investors", force: true do |t|
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
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "company_name"
    t.string   "contact_first_name"
    t.string   "last_name"
    t.string   "company_phone_number"
    t.string   "company_street_address"
    t.string   "company_city"
    t.string   "company_state"
    t.integer  "company_zip"
    t.string   "company_email"
    t.string   "password"
    t.string   "password_confirmation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
