require "test_helper"

class FlatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
