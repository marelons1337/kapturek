# frozen_string_literal: true

class AddTenantsCountToBuildings < ActiveRecord::Migration[6.1]
  def change
    add_column :buildings, :tenants_count, :integer
  end
end
