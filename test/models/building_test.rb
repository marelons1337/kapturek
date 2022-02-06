# frozen_string_literal: true

require 'test_helper'

class BuildingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
