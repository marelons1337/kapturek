# frozen_string_literal: true

json.extract!(
  property_income,
  :id,
  :amount,
  :description,
  :due_date,
  :incomable_type,
  :incomable_id,
  :kind,
  :received_date,
  :created_at,
  :updated_at,
)
json.url(property_income_url(property_income, format: :json))
