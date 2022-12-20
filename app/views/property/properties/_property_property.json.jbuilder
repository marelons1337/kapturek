# frozen_string_literal: true

json.extract!(property_property, :id, :created_at, :updated_at)
json.url(property_property_url(property_property, format: :json))
