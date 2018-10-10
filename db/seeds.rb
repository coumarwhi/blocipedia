# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::String.random(8..15)
)
end

User.create!(
        email: 'blah@blah.com',
        password: 'password',
        confirmed_at: DateTime.now
)

User.create!(
        email: 'coumarwhi@gmail.com',
        password: 'coumarwhi3',
        confirmed_at: DateTime.now,
        role: 'premium'

)
users = User.all

10.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::String.random(5..15),
    body: Faker::String.random(20..100)
  )
end
wikis = Wiki.all

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
