# frozen_string_literal: true

json.array!(@property_payments, partial: "property_payments/property_payment", as: :property_payment)
