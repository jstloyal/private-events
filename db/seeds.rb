# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(name: "akanmu")
user.created_events.create!(name: "birthday", location: "Eko Hotel", date: Time.now)
user.created_events.create!(name: "wedding", locatio: "Civic Center", date: 2.days.from_now)
