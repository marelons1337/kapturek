# frozen_string_literal: true

FactoryBot.define do
  factory :property_payment, class: "Property::Payment" do
    date { "2023-01-06" }
    kind { 1 }
    amount { "MyString" }
    currency { "MyString" }
    description { "MyString" }
    income { nil }
    expense { nil }
    client { nil }
  end

  factory :property_income, class: "Property::Income" do
    name { "MyString" }
    amount { 1 }
    due_date { "2023-01-06" }
    incomable factory: :property_rental
  end

  factory :property_expense, class: "Property::Expense" do
    name { "MyString" }
    amount { 1 }
    due_date { "2023-01-03" }
    expensable factory: :property_rental
  end

  factory :property_property, class: "Property::Property" do
    name { Faker::Games::Witcher.location }
    bought_at { Faker::Date.between(from: 2.days.ago, to: Time.zone.today + 1.month) }
    buy_price { 150000 }
    city { Faker::Address.city }
    country { Faker::Address.country }
    street { Faker::Address.street_name }
    street_no { Random.new.rand(100) }
    surface { Random.new.rand(100) + 1 }
    zip { Faker::Address.zip }
  end

  factory :property_sale, class: "Property::Sale" do
    name { Faker::Games::Witcher.location }
    bought_at { Faker::Date.between(from: 2.days.ago, to: Time.zone.today + 1.month) }
    sold_at { Faker::Date.between(from: Time.zone.today + 2.months, to: Time.zone.today + 12.months) }
    buy_price { 150000 }
    sale_price { 150000 }
    property factory: :property_property
    client factory: :customer_client
  end

  factory :property_rental, class: "Property::Rental" do
    name { Faker::Games::Witcher.location }
    taken_from { Faker::Date.between(from: 2.days.ago, to: Time.zone.today + 1.month) }
    taken_until { Faker::Date.between(from: Time.zone.today + 2.months, to: Time.zone.today + 12.months) }
    rent { 1500 }
    property factory: :property_property
    client factory: :customer_client
  end

  factory :customer_client, class: "Customer::Client" do
    email { Faker::Internet.email }
    name { Faker::Games::Witcher.witcher }
    rent_from { Time.zone.today }
    rent_to { Time.zone.today + 1.year }
  end
end
