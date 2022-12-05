class CreatePropertyRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :property_rentals do |t|
      t.string :name
      t.float :surface
      t.integer :rooms_amount
      t.string :door_no
      t.float :rent
      t.string :country
      t.string :city
      t.string :street
      t.string :street_no
      t.string :floor_no
      t.date :bought_at
      t.float :buy_price
      t.float :sale_price
      t.date :taken_from
      t.date :taken_until
      t.text :description
      t.integer :status, default: 0
      t.string :zip

      t.references :account

      t.timestamps
    end
  end
end
