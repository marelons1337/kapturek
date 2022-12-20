# frozen_string_literal: true

require "rails_helper"

RSpec.describe("property/properties/edit", type: :view) do
  let(:property_property) do
    Property::Property.create!
  end

  before do
    assign(:property_property, property_property)
  end

  it "renders the edit property_property form" do
    render

    assert_select "form[action=?][method=?]", property_property_path(property_property), "post" do
    end
  end
end
