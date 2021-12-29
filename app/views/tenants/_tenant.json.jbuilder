json.extract! tenant, :id, :flat_id, :building_id, :name, :surname, :phone, :email, :account_no, :rent_from, :rent_to, :payment_due, :paid, :debt, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)
