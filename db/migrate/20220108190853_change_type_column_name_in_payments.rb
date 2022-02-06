# frozen_string_literal: true

class ChangeTypeColumnNameInPayments < ActiveRecord::Migration[6.1]
  def change
    rename_column :payments, :type, :payment_type
  end
end
