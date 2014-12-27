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

ActiveRecord::Schema.define(version: 20141226222841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listings", force: :cascade do |t|
    t.string   "business_name",   default: "", null: false
    t.string   "business_number", default: "", null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "image"
    t.string   "vid"
  end

  add_index "listings", ["business_number"], name: "index_listings_on_business_number", unique: true, using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "listing_id"
    t.string   "image"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["listing_id"], name: "index_photos_on_listing_id", using: :btree

  create_table "videos", force: :cascade do |t|
    t.integer  "listing_id"
    t.string   "vid"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["listing_id"], name: "index_videos_on_listing_id", using: :btree

end
