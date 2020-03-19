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
AvailableDate.destroy_all
Host.destroy_all
User.destroy_all

puts "Starting seed..."

activities = {"essential walking tour" => "art-and-culture", "trekking" => "nature", "italian cooking lesson" => "cooking", "local cuisine lesson" => "cooking", "farm visit" => "nature",
              "wine tasting" => "food-and-drink", "tandem paragliding" => "sports", "graffiti tour" => "art-and-culture", "underground tour" => "art-and-culture",
              "traditional sport" => "sports", "ballet show" => "entertainment", "circus show" => "entertainment"}

locations = ["Bali", "Paris", "Florence", "Shanghai", "Vancouver", "Singapore", "Brisbane", "Dubai", "Cartagena"]

tags1 = ["art-and-culture", "food-and-drink", "entertainment", "nature", "sports", "cooking"]
tags2 = ["budget", "mid-range", "luxury"]

descriptions = {"essential walking tour" => "Through this tour you can have a general historical notion, but also the lifestyle of the residents. We will follow with history, culture, day to day, food, religion, curiosities and news. The local guide will be an open book about the city, and provide with the tour a general notion, but also a starting point for those who want to discover more deeply the old town and surroundings. The aim of the project is to provide a close and authentic experience, so the group will be limited to 10 participants maximum.",
                "trekking" => "Located at the foot of the nearby mountain range, at only minutes from the center of town, the Sierras presents itself as an opportunity for those who are just starting in the world of mountaineering. Here you will enjoy a spectacular scenery that offers a magnificent view of the great capital city and the imposing Mountain Range as a reward for the hard efforts to reach it’s summit.",
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


40.times do |index| User.create!(
  email: "user#{index}@email.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "pass1234"
  )
end

20.times do |index| Host.create!(
  email: "user#{index}@email.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "pass1234"
  )
end

Host.all.each do |host|
  45.times do |index|
    AvailableDate.create!(host: host, date: Date.today + index)
  end
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
  host: Activity.find(Activity.first.id + index).host,
  date: Date.today + index,
  group_size: rand(1..9)
  )
end

20.times do |index| Booking.create!(
  activity: Activity.find(Activity.last.id - index),
  user: User.find(User.first.id + index),
  host: Activity.find(Activity.last.id - index).host,
  date: Date.today + index + 20,
  group_size: rand(1..9)
  )
end

past_bookings = []

20.times do |index|
  booking = Booking.new(
  activity: Activity.find(Activity.first.id + index),
  user: User.find(User.first.id + index + 1),
  host: Activity.find(Activity.first.id + index).host,
  date: Date.today - index,
  group_size: rand(1..9)
  )
  booking.save
  past_bookings << booking
end

20.times do |index|
  booking = Booking.new(
  activity: Activity.find(Activity.last.id - index),
  user: User.find(User.first.id + index + 1),
  host: Activity.find(Activity.last.id - index).host,
  date: Date.today - index - 20,
  group_size: rand(1..9)
  )
  booking.save
  past_bookings << booking
end


past_bookings.each do |booking|
  review1 = Review.new(
    content: "Great activity! Loved our guide - was super friendly and knowledgeable.",
    rating: 5,
    )

  review2 = Review.new(
    content: "Would recommend to anyone looking for some adventure.",
    rating: 4,
    )

  review3 = Review.new(
    content: "Enjoyed this, but probably shouldn't have gone out during this time because WE SHOULD ALL PRACTICE SOCIAL DISTANCING.",
    rating: 3,
    )

  review4 = Review.new(
    content: "Bad experience, I would not recommend",
    rating: 2,
    )

  review5 = Review.new(
    content: "Host was irresponsible. I want my money back",
    rating: 1,
    )
  reviews = [review1, review2, review3, review4, review5]
  review = reviews.sample
  review.booking = booking
  review.user = booking.user
  review.save
end





puts "seed done"


