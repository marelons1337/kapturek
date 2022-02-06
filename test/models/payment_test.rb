# frozen_string_literal: true

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
