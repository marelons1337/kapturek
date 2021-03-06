# frozen_string_literal: true

class Flat < ApplicationRecord
  belongs_to :building
  has_many :tenants, dependent: :destroy
  has_many :payments, dependent: :destroy

  validates :door_number, :floor_no, presence: true
  validates :door_number, uniqueness: true

  def debt
    debt_array = Tenant.where(flat_id: self.id).pluck(:debt).compact
    full_debt = debt_array.reduce(:+)
    self["debt"] = full_debt || 0
  end

end

# == Schema Information
#
# Table name: flats
#
#  id           :bigint           not null, primary key
#  debt         :float
#  door_number  :integer          not null
#  floor_no     :integer          not null
#  rent         :float            not null
#  rooms_amount :integer
#  surface      :float            not null
#  taken        :boolean          default(FALSE)
#  taken_until  :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  building_id  :bigint           not null
#
# Indexes
#
#  index_flats_on_building_id  (building_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#
