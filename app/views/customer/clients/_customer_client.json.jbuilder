json.extract! customer_client, :id, :name, :surname, :phone, :email, :rent_from, :rent_to, :paid, :debt, :account_id, :rental_id, :sale_id, :company, :status, :note, :created_at, :updated_at
json.url customer_client_url(customer_client, format: :json)
