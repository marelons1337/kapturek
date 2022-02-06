# frozen_string_literal: true

json.extract! payment, :id, :building_id, :flat_id, :tenant_id, :amount, :payment_type, :received, :comment,
              :created_at, :updated_at
json.url payment_url(payment, format: :json)
