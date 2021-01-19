# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all 
Officer.destroy_all
Review.destroy_all

v = User.create(email: 'vic@vic.com', username: 'vic', password: '123')
j = User.create(email: 'jai@jai.com', username: 'jai', password: '123')

Review.create(title: "Good Experience", content: "She did really well handling the situation", user_id: User.all.sample.id, officer_id: Officer.all.sample.id)
Review.create(title: "First Post!", content: "Just testing out the site", user_id: User.all.sample.id, officer_id: Officer.all.sample.id)