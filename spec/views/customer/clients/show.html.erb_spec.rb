require 'rails_helper'

RSpec.describe "customer/clients/show", type: :view do
  before(:each) do
    assign(:customer_client, Customer::Client.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/MyText/)
  end
end
