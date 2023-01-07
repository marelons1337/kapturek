# frozen_string_literal: true

require "rails_helper"

RSpec.describe("property/payments/show", type: :view) do
  before do
    assign(:property_payment, Property::Payment.create!(
      kind: 2,
      amount: "Amount",
      currency: "Currency",
      description: "Description",
      income: nil,
      expense: nil,
      client: nil,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to(match(/2/))
    expect(rendered).to(match(/Amount/))
    expect(rendered).to(match(/Currency/))
    expect(rendered).to(match(/Description/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
  end
end
