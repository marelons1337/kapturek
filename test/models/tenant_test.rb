# frozen_string_literal: true

require 'test_helper'

class TenantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: tenants
#
#  id                :bigint           not null, primary key
#  account_no        :string
#  active            :boolean
#  debt              :float            default(0.0)
#  email             :string
#  name              :string           not null
#  paid              :boolean          default(FALSE)
#  paid_to           :date
#  payment_due       :date
#  payment_frequency :string
#  phone             :string           not null
#  rent_from         :date             not null
#  rent_to           :date
#  surname           :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  building_id       :bigint           not null
#  flat_id           :bigint           not null
#
# Indexes
#
#  index_tenants_on_building_id  (building_id)
#  index_tenants_on_flat_id      (flat_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#  fk_rails_...  (flat_id => flats.id)
#
