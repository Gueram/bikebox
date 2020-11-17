# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
    )
end

Boxbike.destroy_all
5.times do
  Boxbike.create!(
    address: Faker::Address.street_name,
    capacity: [1, 2, 3, 4, 5].sample,
    price: [10, 20, 30, 40, 50].sample,
    user: User.all.sample 
    )
end