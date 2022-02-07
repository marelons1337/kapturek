# frozen_string_literal: true

class Tenant < ApplicationRecord
  belongs_to :flat
  belongs_to :building
  has_many :payments, dependent: :destroy

  validates :email, format: { with: ApplicationHelper::EMAIL_REGEX, message: I18n.t('forms.invalid_format') }
  validates :phone, format: { with: ApplicationHelper::PHONE_REGEX, message: I18n.t('forms.invalid_format') }
  validates :rent_from, :rent_to, :name, :surname, presence: true
  validate :date_range, :force_one_active
  validates_with FlatBelongingValidator


  before_save :occupy_flat

  # validations begin
  def date_range
    errors.add(:rent_to, I18n.t('forms.wrong_range')) if rent_from >= rent_to
  end

  def force_one_active
    flat = Flat.find_by(id: flat_id)
    determine_active
    other_tenants = Tenant.where(flat_id: flat_id, active: true).where('rent_to >= ? ', Date.today) if active?
    errors.add(:flat_id, I18n.t('forms.too_many_active')) if other_tenants.present? && flat.taken_until > Date.today
  end
  # validations end

  def full_name
    "#{name} #{surname}"
  end

  def occupy_flat
    flat = Flat.find_by(id: flat_id)
    flat.taken = if active?
                   true
                 else
                   false
                 end
    flat.taken_until = rent_to
    flat.save!
  end

  def determine_active
    self.active = if rent_from <= Date.today && rent_to >= Date.today
                    true
                  # occupy_flat # set flat's taken values
                  else
                    false
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
