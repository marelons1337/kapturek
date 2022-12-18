require 'rails_helper'

RSpec.describe "property/properties/new", type: :view do
  before(:each) do
    assign(:property_property, Property::Property.new())
  end

  it "renders new property_property form" do
    render

    assert_select "form[action=?][method=?]", property_properties_path, "post" do
    end
  end
end
