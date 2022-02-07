# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :building
  belongs_to :flat
  belongs_to :tenant

  validates_with FlatBelongingValidator

  PAYMENT_TYPES = {
    'cash' => 'cash',
    'bank transfer' => 'bank transfer'
  }.freeze
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
