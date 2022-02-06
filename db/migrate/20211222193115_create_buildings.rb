# frozen_string_literal: true

class CreateBuildings < ActiveRecord::Migration[6.1]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :address
      t.integer :flats_amount
      t.integer :floors

      t.timestamps
    end
  end
end
