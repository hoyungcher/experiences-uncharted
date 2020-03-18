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
Review.destroy_all
Booking.destroy_all
Activity.destroy_all
Host.destroy_all
User.destroy_all

puts "Starting seed..."

activities = {"essential walking tour" => "art-and-culture", "hiking" => "nature", "italian cooking lesson" => "cooking", "local cuisine lesson" => "cooking", "farm visit" => "nature",
              "wine tasting" => "food-and-drink", "tandem paragliding" => "sports", "graffiti tour" => "art-and-culture", "underground tour" => "art-and-culture",
              "traditional sport" => "sports", "ballet show" => "entertainment", "circus show" => "entertainment"}

locations = ["Buenos Aires", "Paris", "Florence", "Hong Kong", "Vancouver", "Singapore", "Brisbane", "Dubai", "Mexico City"]

tags1 = ["art-and-culture", "food-and-drink", "entertainment", "nature", "sports", "cooking"]
tags2 = ["budget", "mid-range", "luxury"]

descriptions = {"essential walking tour" => "Through this tour you can have a general historical notion, but also the lifestyle of the residents. We will follow with history, culture, day to day, food, religion, curiosities and news. The local guide will be an open book about the city, and provide with the tour a general notion, but also a starting point for those who want to discover more deeply the old town and surroundings. The aim of the project is to provide a close and authentic experience, so the group will be limited to 10 participants maximum.",
                "hiking" => "Located at the foot of the nearby mountain range, at only minutes from the center of town, the Sierras presents itself as an opportunity for those who are just starting in the world of mountaineering. Here you will enjoy a spectacular scenery that offers a magnificent view of the great capital city and the imposing Mountain Range as a reward for the hard efforts to reach it’s summit.",
                "italian cooking lesson" => "Following a recipe could seem easy, but knowing the history and secrets of the dish, being aware of the origin of its ingredients is a real and fulfilling experience! We will relax drinking a good glass of wine and we will be able to see directly how to cook the best dish.",
                "local cuisine lesson" => "Come discover the local cuisine, using locally sourced organic ingredients!",
                "farm visit" => "You will visit the only dairy farm which has a pumpkin field as well",
                "wine tasting" => "This half-day tour will allow you to discover the vineyards located just out of town with ease. You will get a chance to try the rare varieties of locally produced wine.",
                "tandem paragliding" => "If you're adventurous, come try paragliding from the nearby peaks! ",
                "graffiti tour" => "Our 2 hour walking tour will allow you to discover the vibrant street art around the city!",
                "underground tour" => "Come discover the catacombs hidden under the bustling city that you never knew!",
                "traditional sport" => "Come try your hand at unique sports not found anywhere else on the world!",
                "ballet show" => "Visit the opera house for an amazing night of ballet!",
                "circus show" => "For a limited time only, the Cirque du Soleil is coming to town. Don't miss their shows!"}

host_index = []

def convert_price_to_tag(price)
  case price
  when 0..50
    "budget"
  when 51..100
    "mid-range"
  else
    "luxury"
  end
end

def convert_activity_to_tag(activity)

end


20.times do |index| User.create!(
  email: "user#{index}@email.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "pass#{rand(10..100)}"
  )
end

20.times do |index| Host.create!(
  email: "user#{index}@email.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "pass#{rand(10..100)}"
  )
end

20.times do |index|
  activity_name = activities.keys.sample
  Activity.create!(
  name: activity_name,
  city: locations.sample,
  price_per_person: rand(12..250),
  description: descriptions[activity_name],
  host: Host.find(Host.first.id + index),
  duration: rand(1..10),
  max_group_size: 10
  )
end

tags1.each do |tag| Tag.create!(
  name: tag
  )
end

tags2.each do |tag| Tag.create!(
  name: tag
  )
end

Activity.all.each do |activity|
  ActivityTag.create!(
  activity: activity,
  tag: Tag.find_by_name(convert_price_to_tag(activity.price_per_person))
  )
  ActivityTag.create!(
  activity: activity,
  tag: Tag.find_by_name(activities[activity.name])
  )
end

20.times do |index| Booking.create!(
  activity: Activity.find(Activity.first.id + index),
  user: User.find(User.first.id + index),
  host: Host.find(Host.first.id + index),
  date: Date.today + rand(0..30),
  group_size: rand(1..9)
  )
end

booking1 = Booking.create!(
  activity: Activity.find(Activity.first.id),
  user: User.find(User.first.id),
  host: Activity.find(Activity.first.id).host,
  date: Date.today - 2,
  group_size: 4
  )

booking2 = Booking.create!(
  activity: Activity.find(Activity.first.id),
  user: User.find(User.first.id),
  host: Activity.find(Activity.first.id).host,
  date: Date.today - 5,
  group_size: 4
  )

booking3 = Booking.create!(
  activity: Activity.find(Activity.first.id),
  user: User.find(User.first.id),
  host: Activity.find(Activity.first.id).host,
  date: Date.today - 7,
  group_size: 4
  )

review1 = Review.create!(
  content: "Great activity! Loved our guide - was super friendly and knowledgeable.",
  rating: 5,
  user: User.find(User.first.id),
  booking: Booking.find(Booking.first.id)
  )

review2 = Review.create!(
  content: "Would recommend to anyone looking for some adventure.",
  rating: 4,
  user: User.find(User.first.id + 1),
  booking: Booking.find(Booking.first.id)
  )

review3 = Review.create!(
  content: "Enjoyed this, but probably shouldn't have gone out during this time because WE SHOULD ALL PRACTICE SOCIAL DISTANCING.",
  rating: 5,
  user: User.find(User.first.id + 2),
  booking: Booking.find(Booking.first.id)
  )

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
#     t.string "password"
#     t.string "first_name"
#     t.string "last_name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

#   create_table "users", force: :cascade do |t|
#     t.string "email"
#     t.string "password"
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
