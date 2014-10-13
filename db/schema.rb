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

ActiveRecord::Schema.define(version: 20141012120812) do

  create_table "attendees", force: true do |t|
    t.integer  "user_id"
    t.integer  "spotfix_id"
    t.boolean  "confirmed"
    t.boolean  "attended"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.integer  "zoom_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["name"], name: "index_cities_on_name", unique: true, using: :btree

  create_table "invites", force: true do |t|
    t.integer  "user_id"
    t.integer  "invitee_user_id"
    t.integer  "spotfix_id"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "needs", force: true do |t|
    t.integer  "spotfix_id"
    t.string   "name"
    t.integer  "count"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "spotfix_id"
    t.integer  "user_id"
    t.string   "type"
    t.string   "image"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spotfixes", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "fix_date"
    t.integer  "city_id"
    t.string   "location"
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "gender"
    t.string   "location"
    t.string   "age_range"
    t.string   "dob"
    t.string   "image"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
  end

end
