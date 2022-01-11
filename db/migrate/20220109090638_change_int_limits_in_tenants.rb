class ChangeIntLimitsInTenants < ActiveRecord::Migration[6.1]
  def change
    change_column :tenants, :account_no, :string
    change_column :tenants, :phone, :string
  end
end
