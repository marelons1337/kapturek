# frozen_string_literal: true

class CreatePropertyPayments < ActiveRecord::Migration[7.0]
  def change
    create_table(:property_payments) do |t|
      t.string(:name)
      t.date(:date)
      t.integer(:kind)
      t.string(:amount)
      t.string(:currency)
      t.string(:description)

      t.references(:income)
      t.references(:expense)
      t.references(:client)
      t.references(:property)

      t.timestamps
    end
  end
end
