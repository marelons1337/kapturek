# frozen_string_literal: true

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  test 'should make payment' do
    building = buildings(:one)

    tenant_no_debt = tenants(:no_debt)
    flat1 = flats(:one)
    payment_rent = Payment.create!(amount: 1000, building_id: building.id, flat_id: flat1.id, tenant_id: tenant_no_debt.id)
    assert_equal tenant_no_debt.reload.paid_to, Date.today + 1.month
    assert_equal tenant_no_debt.reload.payment_due, Date.today + 1.month

    tenant_low_debt = tenants(:debt_below_rent)
    flat2 = flats(:two)
    payment_above_rent = Payment.create!(amount: 1500, building_id: building.id, flat_id: flat2.id, tenant_id: tenant_low_debt.id)
    assert_equal tenant_low_debt.reload.debt, 0
    assert_equal tenant_low_debt.reload.paid_to, Date.today + 1.month
    assert_equal tenant_low_debt.reload.payment_due, Date.today + 1.month

    tenant_high_debt = tenants(:debt_above_rent)
    flat3 = flats(:three)
    payment_below_rent = Payment.create!(amount: 500, building_id: building.id, flat_id: flat3.id, tenant_id: tenant_high_debt.id)
    assert_equal tenant_high_debt.reload.debt, 1000
    assert_not_equal tenant_high_debt.reload.paid_to, Date.today + 1.month
    assert_not_equal tenant_high_debt.reload.payment_due, Date.today + 1.month

  end
end

# == Schema Information
#
# Table name: payments
#
#  id           :bigint           not null, primary key
#  amount       :float
#  comment      :text
#  payment_type :string
#  received     :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  building_id  :bigint           not null
#  flat_id      :bigint           not null
#  tenant_id    :bigint           not null
#
# Indexes
#
#  index_payments_on_building_id  (building_id)
#  index_payments_on_flat_id      (flat_id)
#  index_payments_on_tenant_id    (tenant_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#  fk_rails_...  (flat_id => flats.id)
#  fk_rails_...  (tenant_id => tenants.id)
#
