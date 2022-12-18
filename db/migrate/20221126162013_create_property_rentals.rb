class CreatePropertyRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :property_rentals do |t|
      t.string :name
      t.float :rent
      t.date :taken_from
      t.date :taken_until
      t.text :description
      t.integer :status, default: 0

      t.references :property
      t.references :client
      t.references :account

      t.timestamps
    end
  end
end
