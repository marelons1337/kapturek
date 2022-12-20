# frozen_string_literal: true

require_relative "./db_helpers"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

10.times do
  property, client = DbHelpers.create_client_and_property_with_associations
  Property::Sale.find_or_create_by!(
    bought_at: Faker::Date.between(from: 2.days.ago, to: Time.zone.today + 1.month),
    buy_price: Random.new.rand(1000000),
    description: Faker::Lorem.paragraph(sentence_count: 10),
    name: Faker::Games::Witcher.location,
    sale_price: Random.new.rand(10000000),
    sold_at: Faker::Date.between(from: Time.zone.today + 2.months, to: Time.zone.today + 3.months),
    status: rand(2),
    property_id: property.id,
    client_id: client.id,
  )

  property1, client1 = DbHelpers.create_client_and_property_with_associations
  Property::Rental.find_or_create_by!(
    description: Faker::Lorem.paragraph(sentence_count: 10),
    name: Faker::Games::Witcher.location,
    rent: Random.new.rand(1000),
    status: rand(3),
    taken_from: Faker::Date.between(from: 9.days.ago, to: 1.day.ago),
    taken_until: Faker::Date.between(from: Time.zone.today + 2.months, to: Time.zone.today + 3.months),
    property_id: property1.id,
    client_id: client1.id,
  )
end
