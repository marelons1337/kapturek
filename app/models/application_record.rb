# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.name_and_id_array_for_select
    all.map { |object| [object.get_name, object.id] }
  end

  def transactions
    (self.expenses + self.incomes).sort_by{ |t| t.id }
  end
end
