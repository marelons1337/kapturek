# frozen_string_literal: true

json.call(
  @property_expense,
  :created_at,
  :updated_at,
  :id,
  :amount,
  :description,
  :due_date,
  :expensable_type,
  :expensable_id,
  :kind,
  :name,
  :received_date,
)
