require 'rails_helper'

RSpec.describe "property/expenses/new", type: :view do
  before(:each) do
    assign(:property_expense, Property::Expense.new())
  end

  it "renders new property_expense form" do
    render

    assert_select "form[action=?][method=?]", property_expenses_path, "post" do
    end
  end
end
