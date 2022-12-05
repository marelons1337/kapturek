# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

10.times do
  Property::Sale.create!(
    bought_at: Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month),
    buy_price: Random.new.rand(1000000),
    city: Faker::Address.city,
    country: Faker::Address.country,
    description: Faker::Lorem.paragraph(sentence_count: 10),
    door_no: Random.new.rand(100),
    floor_no: Random.new.rand(100),
    name: Faker::Games::Witcher.location,
    rooms_amount: Random.new.rand(10),
    sale_price: Random.new.rand(10000000),
    sold_at: Faker::Date.between(from: Date.today + 2.months, to: Date.today + 3.months),
    status: rand(3),
    street: Faker::Address.street_name,
    street_no: Random.new.rand(100),
    surface: Random.new.rand(100),
    zip: Faker::Address.zip,
  )
end

10.times do
  Property::Rental.create!(
    bought_at: Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month),
    buy_price: Random.new.rand(1000000),
    city: Faker::Address.city,
    country: Faker::Address.country,
    description: Faker::Lorem.paragraph(sentence_count: 10),
    door_no: Random.new.rand(100),
    floor_no: Random.new.rand(100),
    name: Faker::Games::Witcher.location,
    rent: Random.new.rand(1000),
    rooms_amount: Random.new.rand(10),
    status: rand(3),
    street: Faker::Address.street_name,
    street_no: Random.new.rand(100),
    surface: Random.new.rand(100),
    taken_from: Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month),
    taken_until: Faker::Date.between(from: Date.today + 2.months, to: Date.today + 3.months),
    zip: Faker::Address.zip,
  )
end