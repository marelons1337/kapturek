require 'rails_helper'

RSpec.describe "customer/clients/index", type: :view do
  before(:each) do
    assign(:customer_clients, [
      Customer::Client.create!(
        name: "Name",
        surname: "Surname",
        phone: "Phone",
        email: "Email",
        paid: 2.5,
        debt: 3.5,
        account: nil,
        rental: nil,
        sale: nil,
        company: false,
        status: 4,
        note: "MyText"
      ),
      Customer::Client.create!(
        name: "Name",
        surname: "Surname",
        phone: "Phone",
        email: "Email",
        paid: 2.5,
        debt: 3.5,
        account: nil,
        rental: nil,
        sale: nil,
        company: false,
        status: 4,
        note: "MyText"
      )
    ])
  end

  it "renders a list of customer/clients" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Surname".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
