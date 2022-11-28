class Property::Rental < ApplicationRecord
  belongs_to :account, optional: true
end

# == Schema Information
#
# Table name: property_rentals
#
#  id           :integer          not null, primary key
#  bought_at    :date
#  buy_price    :float
#  city         :string
#  country      :string
#  door_no      :string
#  floor_no     :string
#  name         :string
#  rent         :float
#  rooms_amount :integer
#  sale_price   :float
#  street       :string
#  street_no    :string
#  surface      :float
#  taken_from   :date
#  taken_until  :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  account_id   :integer
#
# Indexes
#
#  index_property_rentals_on_account_id  (account_id)
#
