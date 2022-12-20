# frozen_string_literal: true

require "rails_helper"

RSpec.describe("property/properties/index", type: :view) do
  before do
    assign(:property_properties, [
      Property::Property.create!,
      Property::Property.create!,
    ])
  end

  it "renders a list of property/properties" do
    render
  end
end
