class ConstrainsFortables < ActiveRecord::Migration[6.1]
  def change
    change_column :flats, :door_number, :integer, null: false
    change_column :flats, :floor_no, :integer, null: false
    change_column :flats, :surface, :float, null: false
    change_column :flats, :taken, :boolean, default: false
    change_column :flats, :rent, :float, null: false

    change_column :buildings, :address, :string, null: false
    change_column :buildings, :floors, :integer, null: false
    change_column :buildings, :flats_amount, :integer, null: false

    change_column :tenants, :name, :string, null: false
    change_column :tenants, :surname, :string, null: false
    change_column :tenants, :phone, :integer, null: false
    change_column :tenants, :paid, :boolean, default: false
    change_column :tenants, :rent_from, :date, null: false
    
  end
end
