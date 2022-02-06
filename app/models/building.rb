# frozen_string_literal: true

class Building < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_many :tenants, through: :flats # chyba niepotrzebne jak mamy building_id w tenancie

  def flats_amount
    flats_amount ||= Flat.where(building_id: id).count
  end

  def tenants_count
    tenants_amount ||= Tenant.where(building_id: id).count
  end

  def flats_taken_display
    all = flats.count
    taken = Flat.where(taken: true, building_id: id).count
    ret = "#{taken}/#{all}"
  end

  def total_due
    debt_array = Flat.where(building_id: id).pluck(:debt).compact
    debt = debt_array.reduce(:+)
  end

  def total_revenue
    revenue_array = Flat.where(building_id: id).pluck(:rent).compact
    revenue = revenue_array.reduce(:+)
  end
end

# == Schema Information
#
# Table name: buildings
#
#  id            :bigint           not null, primary key
#  address       :string           not null
#  flats_amount  :integer          not null
#  floors        :integer          not null
#  name          :string
#  tenants_count :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
