class AddDefaultDebtToTenants < ActiveRecord::Migration[6.1]
  def change
    change_column :tenants, :debt, :float, default: 0
  end
end
