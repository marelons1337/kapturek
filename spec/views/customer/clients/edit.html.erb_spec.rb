require 'rails_helper'

RSpec.describe "customer/clients/edit", type: :view do
  let(:customer_client) {
    Customer::Client.create!(
      name: "MyString",
      surname: "MyString",
      phone: "MyString",
      email: "MyString",
      paid: 1.5,
      debt: 1.5,
      account: nil,
      rental: nil,
      sale: nil,
      company: false,
      status: 1,
      note: "MyText"
    )
  }

  before(:each) do
    assign(:customer_client, customer_client)
  end

  it "renders the edit customer_client form" do
    render

    assert_select "form[action=?][method=?]", customer_client_path(customer_client), "post" do

      assert_select "input[name=?]", "customer_client[name]"

      assert_select "input[name=?]", "customer_client[surname]"

      assert_select "input[name=?]", "customer_client[phone]"

      assert_select "input[name=?]", "customer_client[email]"

      assert_select "input[name=?]", "customer_client[paid]"

      assert_select "input[name=?]", "customer_client[debt]"

      assert_select "input[name=?]", "customer_client[account_id]"

      assert_select "input[name=?]", "customer_client[rental_id]"

      assert_select "input[name=?]", "customer_client[sale_id]"

      assert_select "input[name=?]", "customer_client[company]"

      assert_select "input[name=?]", "customer_client[status]"

      assert_select "textarea[name=?]", "customer_client[note]"
    end
  end
end
