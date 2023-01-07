# frozen_string_literal: true

json.extract!(
  property_payment,
  :id,
  :date,
  :kind,
  :amount,
  :currency,
  :description,
  :income_id,
  :expense_id,
  :client_id,
  :created_at,
  :updated_at,
)
json.url(property_payment_url(property_payment, format: :json))
