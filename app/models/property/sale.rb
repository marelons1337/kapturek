class Property::Sale < ApplicationRecord
end

# == Schema Information
#
# Table name: property_sales
#
#  id           :integer          not null, primary key
#  bought_at    :date
#  buy_price    :string
#  city         :string
#  country      :string
#  door_numer   :string
#  floor_no     :string
#  name         :string
#  rooms_amount :string
#  sale_price   :string
#  sold_at      :date
#  street       :string
#  street_no    :string
#  surface      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
