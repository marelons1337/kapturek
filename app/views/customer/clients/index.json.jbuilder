# frozen_string_literal: true

json.array!(@customer_clients, partial: "customer_clients/customer_client", as: :customer_client)
