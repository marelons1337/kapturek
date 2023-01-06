# frozen_string_literal: true

json.array!(@property_incomes, partial: "property_incomes/property_income", as: :property_income)
