class CreateFlats < ActiveRecord::Migration[6.1]
  def change
    create_table :flats do |t|
      t.references :building, null: false, foreign_key: true
      t.integer :floor_no
      t.float :surface
      t.integer :rooms_amount
      t.integer :door_number
      t.float :rent
      t.boolean :taken
      t.date :taken_until
      t.float :debt

      t.timestamps
    end
  end
end
