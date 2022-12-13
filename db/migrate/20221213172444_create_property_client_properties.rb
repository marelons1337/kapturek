class CreatePropertyClientProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :property_client_properties do |t|
      t.references :client
      t.integer :property_id
      t.string :property_type
      t.references :account

      t.timestamps
    end
  end
end
