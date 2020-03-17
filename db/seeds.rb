# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Destroying database..."
ActivityTag.destroy_all
Tag.destroy_all
Booking.destroy_all
Activity.destroy_all
Host.destroy_all
User.destroy_all

puts "Starting seed..."

activities = ["swimming", "hiking", "trekking", "bowling", "archery", "mountain-climbing", "sky-diving", "bungee jumping", "paragliding", "wakeboarding"]

tags = ["Art and culture", "Food and drink", "Entertainment", "Nature", "Sports", "Cooking", "Wellness"]

host_index = []

10.times do |index| User.create!(
  email: "user#{index}@email.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  encrypted_password: "pass#{rand(1..100)}"
  )
end

10.times do |index| Host.create!(
  email: "user#{index}@email.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "pass#{rand(1..100)}"
  )
end

10.times do |index| Activity.create!(
  name: activities.sample,
  location: Faker::Address.country,
  price_per_day: rand(50..100),
  description: Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
  host: Host.find(Host.first.id + index)
  )
end

tags.each do |tag| Tag.create!(
  name: tag
  )
end

20.times do ActivityTag.create!(
  activity: Activity.all.sample,
  tag: Tag.all.sample
  )
end


10.times do |index | Booking.create!(
  activity: Activity.find(Activity.first.id + index),
  user: User.find(User.first.id + index),
  host: Host.find(Host.first.id + index),
  date: Date.today + rand(0..30)
  )
end

puts "seed done"

# ActiveRecord::Schema.define(version: 2020_03_16_072211) do

#   # These are extensions that must be enabled in order to support this database
#   enable_extension "plpgsql"

#   create_table "activities", force: :cascade do |t|
#     t.string "name"
#     t.string "location"
#     t.integer "price_per_day"
#     t.text "description"
#     t.bigint "host_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["host_id"], name: "index_activities_on_host_id"
#   end

#   create_table "bookings", force: :cascade do |t|
#     t.bigint "activity_id"
#     t.bigint "user_id"
#     t.bigint "host_id"
#     t.date "date"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["activity_id"], name: "index_bookings_on_activity_id"
#     t.index ["host_id"], name: "index_bookings_on_host_id"
#     t.index ["user_id"], name: "index_bookings_on_user_id"
#   end

#   create_table "hosts", force: :cascade do |t|
#     t.string "email"
#     t.string "encrypted_password"
#     t.string "first_name"
#     t.string "last_name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

#   create_table "users", force: :cascade do |t|
#     t.string "email"
#     t.string "encrypted_password"
#     t.string "first_name"
#     t.string "last_name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

#   add_foreign_key "activities", "hosts"
#   add_foreign_key "bookings", "activities"
#   add_foreign_key "bookings", "hosts"
#   add_foreign_key "bookings", "users"
# end
