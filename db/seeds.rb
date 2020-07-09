# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
akanmu = User.create(name: "akanmu")
akanmu.created_events.create!(name: "house party", location: "my house", date: Time.now, description: "The most house party of house parties")
akanmu.created_events.create!(name: "bubble bath party", location: "my bubble bath", date: 2.days.from_now, description: "Nothing extra ordinary, wine, caviar, troufles...")
akanmu.created_events.create!(name: "sandbox party", location: "my sandbox", date: 1.month.from_now, description: "dont forget your toys (to not use mine again)")
