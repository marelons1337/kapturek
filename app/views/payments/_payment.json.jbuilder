json.extract! payment, :id, :building_id, :flat_id, :tenant_id, :amount, :type, :received, :comment, :created_at, :updated_at
json.url payment_url(payment, format: :json)
