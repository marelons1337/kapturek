class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :building, null: false, foreign_key: true
      t.references :flat, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: true
      t.float :amount
      t.string :type
      t.date :received
      t.text :comment

      t.timestamps
    end
  end
end
