# frozen_string_literal: true

json.extract! flat, :id, :building_id, :floor_no, :surface, :rooms_amount, :door_number, :rent, :taken, :taken_until,
              :debt, :created_at, :updated_at
json.url flat_url(flat, format: :json)
