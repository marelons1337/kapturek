# frozen_string_literal: true

json.array!(@property_rentals, partial: "property_rentals/property_rental", as: :property_rental)
