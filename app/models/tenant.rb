class Tenant < ApplicationRecord
  belongs_to :flat
  belongs_to :building

  validates :email, format: { with: ApplicationHelper::EMAIL_REGEX, message: I18n.t('forms.invalid_format')}
  validates :phone, format: { with: ApplicationHelper::PHONE_REGEX, message: I18n.t('forms.invalid_format')}
  validates :rent_from, :rent_to, :name, :surname, presence: true
  validate :flat_belonging_to_building, :date_range, :force_one_active

  before_save :determine_active

  # validations begin
  def flat_belonging_to_building
    building = Building.find_by(id: building_id)
    unless flat_id.in?(building&.flat_ids)
      errors.add(:flat_id, I18n.t('forms.flat_not_in_building'))
    end
  end

  def date_range
    errors.add(:rent_to, I18n.t('forms.wrong_range')) if rent_from >= rent_to || rent_to < Date.today
  end

  def force_one_active
    flat = Flat.find_by(id: flat_id)
    other_tenants = Tenant.where(flat_id: flat_id, active: true)
    unless other_tenants.empty?
      errors.add(:flat_id, I18n.t('forms.too_many_active'))
    end
  end
  # validations end


  def full_name
    return "#{name} #{surname}"
  end

  def occupy_flat
    flat = Flat.find_by(id: flat_id)
    flat.taken = true
    flat.taken_until = self.rent_to
    flat.save!
  end

  def determine_active
    if rent_from <= Date.today && rent_to >= Date.today
      self.active = true
      occupy_flat # set flat's taken values
    else
      self.active = false
    end
  end
end

# == Schema Information
#
# Table name: tenants
#
#  id          :bigint           not null, primary key
#  account_no  :string
#  active      :boolean
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
