# frozen_string_literal: true

class AddFieldsToExpenseAndIncome < ActiveRecord::Migration[7.0]
  def change
    add_reference(:property_expenses, :client)
    add_reference(:property_incomes, :client)
    add_reference(:property_expenses, :property)
    add_reference(:property_incomes, :property)
  end
end
