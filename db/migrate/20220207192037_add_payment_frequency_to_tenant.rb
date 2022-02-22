class AddPaymentFrequencyToTenant < ActiveRecord::Migration[6.1]
  def change
    add_column :tenants, :payment_frequency, :string
  end
end
