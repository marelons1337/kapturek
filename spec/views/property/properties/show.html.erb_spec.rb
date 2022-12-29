# frozen_string_literal: true

require "rails_helper"

RSpec.describe("property/properties/show", type: :view) do
  before do
    assign(:property_property, create(:property_property))
  end

  it "renders attributes in <p>" do
    render
  end
end
