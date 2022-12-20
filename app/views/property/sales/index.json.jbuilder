# frozen_string_literal: true

json.array!(@property_sales, partial: "property_sales/property_sale", as: :property_sale)
