# frozen_string_literal: true

class Createpropertiesales < ActiveRecord::Migration[7.0]
  def change
    create_table(:property_sales) do |t|
      t.string(:name)
      t.text(:description)
      t.date(:bought_at)
      t.date(:sold_at)
      t.float(:buy_price)
      t.float(:sale_price)
      t.integer(:status, default: 0)

      t.references(:property)
      t.references(:client)
      t.references(:account)

      t.timestamps
    end
  end
end
