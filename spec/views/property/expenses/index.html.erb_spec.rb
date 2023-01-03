require 'rails_helper'

RSpec.describe "property/expenses/index", type: :view do
  before(:each) do
    assign(:property_expenses, [
      Property::Expense.create!(),
      Property::Expense.create!()
    ])
  end

  it "renders a list of property/expenses" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
