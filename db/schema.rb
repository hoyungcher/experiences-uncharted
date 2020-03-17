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

ActiveRecord::Schema.define(version: 2020_03_17_022958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "price_per_day"
    t.text "description"
    t.bigint "host_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_activities_on_host_id"
  end

  create_table "activity_tags", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_tags_on_activity_id"
    t.index ["tag_id"], name: "index_activity_tags_on_tag_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "user_id"
    t.bigint "host_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_bookings_on_activity_id"
    t.index ["host_id"], name: "index_bookings_on_host_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "activities", "hosts"
  add_foreign_key "activity_tags", "activities"
  add_foreign_key "activity_tags", "tags"
  add_foreign_key "bookings", "activities"
  add_foreign_key "bookings", "hosts"
  add_foreign_key "bookings", "users"
end
