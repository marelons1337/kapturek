class CreatePropertySales < ActiveRecord::Migration[7.0]
  def change
    create_table :property_sales do |t|
      t.string :name
      t.float :surface
      t.integer :rooms_amount
      t.string :door_no
      t.string :country
      t.string :city
      t.string :street
      t.string :street_no
      t.string :floor_no
      t.text :description
      t.date :bought_at
      t.date :sold_at
      t.float :buy_price
      t.float :sale_price
      t.integer :status, default: 0
      t.string :zip

      t.references :account

      t.timestamps
    end
  end
end
