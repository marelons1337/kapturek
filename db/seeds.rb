# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  Property::Sale.create!(
    bought_at: Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month),
    buy_price: Random.new.rand(1000000),
    city: Faker::Address.city,
    country: Faker::Address.country,
    door_no: Random.new.rand(100),
    floor_no: Random.new.rand(100),
    name: Faker::Ancient.god,
    rooms_amount: Random.new.rand(10),
    sale_price: Random.new.rand(10000000),
    sold_at: Faker::Date.between(from: Date.today + 2.months, to: Date.today + 3.months),
    status: Property::Sale::DEFAULT_STATUSES.sample(1)[0],
    street: Faker::Address.street_name,
    street_no: Random.new.rand(100),
    surface: Random.new.rand(100),
    zip: Faker::Address.zip,
  )
end