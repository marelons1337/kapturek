# frozen_string_literal: true

class AddActiveToTenants < ActiveRecord::Migration[6.1]
  def change
    add_column :tenants, :active, :boolean
  end
end
