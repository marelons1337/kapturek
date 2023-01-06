# frozen_string_literal: true

json.extract!(
  property_rental,
  :id,
  :name,
  :surface,
  :rooms_amount,
  :door_no,
  :rent,
  :country,
  :city,
  :street,
  :street_no,
  :floor_no,
  :bought_at,
  :buy_price,
  :sale_price,
  :taken_from,
  :taken_until,
  :account_id,
  :created_at,
  :updated_at,
)
json.url(property_rental_url(property_rental, format: :json))
