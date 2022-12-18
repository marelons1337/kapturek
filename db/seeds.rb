# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

20.times do
  Property::Property.create!(
    bought_at: Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month),
    buy_price: Random.new.rand(1000000),
    city: Faker::Address.city,
    country: Faker::Address.country,
    description: Faker::Lorem.paragraph(sentence_count: 10),
    door_no: Random.new.rand(100),
    floor_no: Random.new.rand(100),
    name: Faker::Games::Witcher.location,
    rooms_amount: Random.new.rand(10) + 1,
    sale_price: Random.new.rand(10000000),
    sold_at: Faker::Date.between(from: Date.today + 2.months, to: Date.today + 3.months),
    status: rand(3),
    street: Faker::Address.street_name,
    street_no: Random.new.rand(100),
    surface: Random.new.rand(100) + 1,
    zip: Faker::Address.zip,
  )
end

20.times do
  Customer::Client.create!(
    company: [true, false].sample,
    debt: [0, 500, 1000].sample,
    email: Faker::Internet.email,
    name: Faker::Games::Witcher.witcher,
    paid: Random.new.rand(10000),
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    rent_from: Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month),
    rent_to: Faker::Date.between(from: Date.today + 2.months, to: Date.today + 3.months),
    surname: Faker::Games::Witcher.sign,
  )
end

10.times do
  Property::Sale.create!(
    bought_at: Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month),
    buy_price: Random.new.rand(1000000),
    description: Faker::Lorem.paragraph(sentence_count: 10),
    name: Faker::Games::Witcher.location,
    sale_price: Random.new.rand(10000000),
    sold_at: Faker::Date.between(from: Date.today + 2.months, to: Date.today + 3.months),
    status: rand(2),
    property_id: Property::Property.all.sample.id,
    client_id: Customer::Client.all.sample.id,
  )
end

10.times do |i|
  Property::Rental.create!(
    description: Faker::Lorem.paragraph(sentence_count: 10),
    name: Faker::Games::Witcher.location,
    rent: Random.new.rand(1000),
    status: rand(3),
    taken_from: Faker::Date.between(from: 9.days.ago, to: 1.day.ago),
    taken_until: Faker::Date.between(from: Date.today + 2.months, to: Date.today + 3.months),
    property_id: Property::Property.all.sample.id,
    client_id: Customer::Client.all.sample.id,
  )
end