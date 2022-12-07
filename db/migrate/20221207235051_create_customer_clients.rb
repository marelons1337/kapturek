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
      t.references :account, null: false, foreign_key: true
      t.references :rental, null: false, foreign_key: true
      t.references :sale, null: false, foreign_key: true
      t.boolean :company
      t.integer :status
      t.text :note

      t.timestamps
    end
  end
end
