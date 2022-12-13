FactoryBot.define do
  factory :customer_client_property, class: 'Customer::ClientProperty' do
    client { nil }
    property_sale { nil }
    property_rental { nil }
  end

  factory :property_sale, class: 'Property::Sale' do
    bought_at { Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month) }
    buy_price { 150000 }
    city { Faker::Address.city }
    country { Faker::Address.country }
    street { Faker::Address.street_name }
    street_no { Random.new.rand(100) }
    surface { Random.new.rand(100) }
  end

  factory :property_rental, class: 'Property::Rental' do
    bought_at { Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month) }
    buy_price { 150000 }
    city { Faker::Address.city }
    country { Faker::Address.country }
    rent { Random.new.rand(1000) }
    street { Faker::Address.street_name }
    street_no { Random.new.rand(100) }
    surface { Random.new.rand(100) }
  end

  factory :customer_client, class: 'Customer::Client' do
    email { Faker::Internet.email }
    name { Faker::Games::Witcher.witcher }
    rent_from { Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month) }
  end
end