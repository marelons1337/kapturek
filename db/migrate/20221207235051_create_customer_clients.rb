class CreateCustomerClients < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_clients do |t|
      t.string :name
      t.string :surname
      t.string :phone
      t.string :email
      t.date :rent_from
      t.date :rent_to
      t.float :paid
      t.float :debt
      t.boolean :company, default: false
      t.text :note

      t.references :account

      t.timestamps
    end
  end
end
