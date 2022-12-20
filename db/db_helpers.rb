module DbHelpers
  def self.create_client_and_property_with_associations
    property_data = {
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
    }

    client_data = {
      company: [true, false].sample,
      debt: [0, 500, 1000].sample,
      email: Faker::Internet.email,
      name: Faker::Games::Witcher.witcher,
      paid: Random.new.rand(10000),
      phone: Faker::PhoneNumber.phone_number_with_country_code,
      rent_from: Faker::Date.between(from: 2.days.ago, to: Date.today + 1.month),
      rent_to: Faker::Date.between(from: Date.today + 2.months, to: Date.today + 3.months),
      surname: Faker::Games::Witcher.sign,
    }

    property = Property::Property.find_or_create_by!(property_data)

    client = Customer::Client.find_or_create_by!(client_data)

    [property, client]
  end
end