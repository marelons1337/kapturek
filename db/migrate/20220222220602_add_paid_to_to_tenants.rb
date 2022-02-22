class AddPaidToToTenants < ActiveRecord::Migration[6.1]
  def change
    add_column :tenants, :paid_to, :date
  end
end
