class Payment < ApplicationRecord
  belongs_to :building
  belongs_to :flat
  belongs_to :tenant
end
