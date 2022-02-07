class FlatBelongingValidator < ActiveModel::Validator
  def validate(record)
    building = Building.find_by(id: record.building_id)
    if record.class.name == 'Flat'
      record.errors.add(:id, I18n.t('forms.flat_not_in_building')) unless record.id.in?(building&.flat_ids)
    else
      record.errors.add(:flat_id, I18n.t('forms.flat_not_in_building')) unless record.flat_id.in?(building&.flat_ids)
    end
  end
end