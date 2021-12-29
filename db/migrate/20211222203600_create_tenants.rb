class CreateTenants < ActiveRecord::Migration[6.1]
  def change
    create_table :tenants do |t|
      t.references :flat, null: false, foreign_key: true
      t.references :building, null: false, foreign_key: true
      t.string :name
      t.string :surname
      t.integer :phone
      t.string :email
      t.integer :account_no
      t.date :rent_from
      t.date :rent_to
      t.date :payment_due
      t.boolean :paid
      t.float :debt

      t.timestamps
    end
  end
end
