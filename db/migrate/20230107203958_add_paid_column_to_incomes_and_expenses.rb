# frozen_string_literal: true

class AddPaidColumnToIncomesAndExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column(:property_incomes, :paid, :boolean, default: false)
    add_column(:property_expenses, :paid, :boolean, default: false)
  end
end
