FactoryBot.define do
  factory :property_property, class: 'Property::Property' do
    name { Faker::Games::Witcher.location }
    bought_at { Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month) }
    buy_price { 150000 }
    city { Faker::Address.city }
    country { Faker::Address.country }
    street { Faker::Address.street_name }
    street_no { Random.new.rand(100) }
    surface { Random.new.rand(100) }
    zip { Faker::Address.zip }
  end

  factory :property_sale, class: 'Property::Sale' do
    name { Faker::Games::Witcher.location }
    bought_at { Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month) }
    sold_at { Faker::Date.between(from: Date.today + 2.months , to: Date.today + 12.months) }
    buy_price { 150000 }
    sale_price { 150000 }
    association :property, factory: :property_property
    association :client, factory: :customer_client
  end

  factory :property_rental, class: 'Property::Rental' do
    name { Faker::Games::Witcher.location }
    taken_from { Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month) }
    taken_until { Faker::Date.between(from: Date.today + 2.months , to: Date.today + 12.months) }
    rent { 1500 }
    association :property, factory: :property_property
    association :client, factory: :customer_client
  end

  factory :customer_client, class: 'Customer::Client' do
    email { Faker::Internet.email }
    name { Faker::Games::Witcher.witcher }
    rent_from { Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month) }
  end
end