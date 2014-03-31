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

ActiveRecord::Schema.define(version: 20140331180733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interests", force: true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "interests_users", id: false, force: true do |t|
    t.integer "interest_id", null: false
    t.integer "user_id",     null: false
  end

  create_table "locations", force: true do |t|
    t.string  "name"
    t.string  "address"
    t.integer "phone"
    t.string  "website"
    t.string  "photo_url"
  end

  create_table "meetings", force: true do |t|
    t.integer "location_id"
    t.date    "date"
    t.time    "time"
  end

  create_table "meetings_users", id: false, force: true do |t|
    t.integer "meeting_id", null: false
    t.integer "user_id",    null: false
  end

  create_table "requests", force: true do |t|
    t.integer  "user_id"
    t.boolean  "confirmed"
    t.integer  "meeting_id"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["meeting_id"], name: "index_requests_on_meeting_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.date     "dob"
    t.string   "zipcode"
    t.boolean  "admin"
    t.string   "password_digest"
    t.string   "profile_pic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
