class CreateCustomerClientProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_client_properties do |t|
      t.references :client
      t.references :property_sale
      t.references :property_rental
      t.references :account

      t.timestamps
    end
  end
end
