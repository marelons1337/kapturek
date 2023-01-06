# frozen_string_literal: true

json.extract!(
  property_sale,
  :id,
  :name,
  :surface,
  :rooms_amount,
  :door_no,
  :country,
  :city,
  :street,
  :street_no,
  :floor_no,
  :bought_at,
  :sold_at,
  :buy_price,
  :sale_price,
  :created_at,
  :updated_at,
)
json.url(property_sale_url(property_sale, format: :json))
