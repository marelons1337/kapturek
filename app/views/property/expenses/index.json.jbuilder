# frozen_string_literal: true

json.array!(@property_expenses, partial: "property_expenses/property_expense", as: :property_expense)
