class CreatePropertySales < ActiveRecord::Migration[7.0]
  def change
    create_table :property_sales do |t|
      t.string :name
      t.string :surface
      t.string :rooms_amount
      t.string :door_numer
      t.string :country
      t.string :city
      t.string :street
      t.string :street_no
      t.string :floor_no
      t.date :bought_at
      t.date :sold_at
      t.string :buy_price
      t.string :sale_price

      t.timestamps
    end
  end
end
