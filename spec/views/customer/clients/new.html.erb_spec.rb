require 'rails_helper'

RSpec.describe "customer/clients/new", type: :view do
  before(:each) do
    assign(:customer_client, Customer::Client.new(
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
    ))
  end

  it "renders new customer_client form" do
    render

    assert_select "form[action=?][method=?]", customer_clients_path, "post" do

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
