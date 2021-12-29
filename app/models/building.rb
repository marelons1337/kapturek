class Building < ApplicationRecord
    has_many :flats
    has_many :tenants, through: :flats

    
end

# == Schema Information
#
# Table name: buildings
#
#  id           :bigint           not null, primary key
#  address      :string           not null
#  flats_amount :integer          not null
#  floors       :integer          not null
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
