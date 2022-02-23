# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :building
  belongs_to :flat
  belongs_to :tenant

  validates_with FlatBelongingValidator

  before_save :make_payment

  PAYMENT_TYPES = {
    'cash' => 'cash',
    'bank transfer' => 'bank transfer'
  }.freeze

  def make_payment
    # byebug
    begin
      tenant = Tenant.find(self.tenant_id)
      rent_paid = self.amount >= tenant.rent
      today = Date.today
      if rent_paid
        rest_amount = self.amount - tenant.rent
        tenant.debt = tenant.debt - rest_amount if rest_amount > 0
        case tenant.payment_frequency
        when 'biweekly'
          tenant.paid_to = today + 2.weeks
          tenant.payment_due = today + 2.weeks if tenant.debt <= 0
        when 'monthly'
          tenant.paid_to = today + 1.month
          tenant.payment_due = today + 1.month if tenant.debt <= 0
        when 'bimonthly'
          tenant.paid_to = today + 2.months
          tenant.payment_due = today + 2.months if tenant.debt <= 0
        else
          nil
        end
      else
        tenant.debt -= self.amount
      end
      tenant.save!
    rescue => exception
      Rails.logger.info("Error when making payment #{exception}")
    end
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
