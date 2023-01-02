# frozen_string_literal: true

class AddStatusToCustomerClient < ActiveRecord::Migration[7.0]
  def change
    add_column(:customer_clients, :status, :integer, default: 0)
  end
end
