class CreatePropertyExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :property_expenses do |t|
      t.string :name
      t.string :kind
      t.string :amount
      t.string :description
      t.date :received_date
      t.date :due_date

      t.integer :expensable_id
      t.string :expensable_type

      t.timestamps
    end
  end
end
