class Tenant < ApplicationRecord
  belongs_to :flat
  belongs_to :building

  validates :email, format: { with: ApplicationHelper::EMAIL_REGEX, message: I18n.t('forms.invalid_format')}
  validates :phone, format: { with: ApplicationHelper::PHONE_REGEX, message: I18n.t('forms.invalid_format')}
  validates :rent_from, :name, :surname, presence: true
  validate :flat_belonging_to_building

  def flat_belonging_to_building
    building = Building.find(building_id)
    unless flat_id.in?(building.flat_ids)
      errors.add(:flat_id, I18n.t('forms.flat_not_in_building'))
    end
  end

  def full_name
    return "#{name} #{surname}"
  end
end

# == Schema Information
#
# Table name: tenants
#
#  id          :bigint           not null, primary key
#  account_no  :string
#  debt        :float
#  email       :string
#  name        :string           not null
#  paid        :boolean          default(FALSE)
#  payment_due :date
#  phone       :string           not null
#  rent_from   :date             not null
#  rent_to     :date
#  surname     :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  building_id :bigint           not null
#  flat_id     :bigint           not null
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
