require 'rails_helper'

RSpec.describe "property/expenses/edit", type: :view do
  let(:property_expense) {
    Property::Expense.create!()
  }

  before(:each) do
    assign(:property_expense, property_expense)
  end

  it "renders the edit property_expense form" do
    render

    assert_select "form[action=?][method=?]", property_expense_path(property_expense), "post" do
    end
  end
end
