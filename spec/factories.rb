FactoryBot.define do
  factory :property_sale, class: 'Property::Sale' do
    bought_at { Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month) }
    buy_price { Random.new.rand(1000000) }
    city { Faker::Address.city }
    country { Faker::Address.country }
    street { Faker::Address.street_name }
    street_no { Random.new.rand(100) }
    surface { Random.new.rand(100) }
  end

  factory :property_rental, class: 'Property::Rental' do
    bought_at { Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month) }
    buy_price { Random.new.rand(1000000) }
    city { Faker::Address.city }
    country { Faker::Address.country }
    rent { Random.new.rand(1000) }
    street { Faker::Address.street_name }
    street_no { Random.new.rand(100) }
    surface { Random.new.rand(100) }
  end

#   factory(:user) do
#     email { Faker::Internet.email }
#     password { Faker::Internet.password }
#   end
end