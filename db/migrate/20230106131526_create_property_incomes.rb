# frozen_string_literal: true

class CreatePropertyIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table(:property_incomes) do |t|
      t.string(:name)
      t.string(:amount)
      t.string(:description)
      t.date(:due_date)
      t.string(:kind)
      t.date(:received_date)

      t.string(:incomable_type)
      t.integer(:incomable_id)

      t.timestamps
    end
  end
end
