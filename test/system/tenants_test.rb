require "application_system_test_case"

class TenantsTest < ApplicationSystemTestCase
  setup do
    @tenant = tenants(:one)
  end

  test "visiting the index" do
    visit tenants_url
    assert_selector "h1", text: "Tenants"
  end

  test "creating a Tenant" do
    visit tenants_url
    click_on "New Tenant"

    fill_in "Account no", with: @tenant.account_no
    fill_in "Building", with: @tenant.building_id
    fill_in "Debt", with: @tenant.debt
    fill_in "Email", with: @tenant.email
    fill_in "Flat", with: @tenant.flat_id
    fill_in "Name", with: @tenant.name
    check "Paid" if @tenant.paid
    fill_in "Payment due", with: @tenant.payment_due
    fill_in "Phone", with: @tenant.phone
    fill_in "Rent from", with: @tenant.rent_from
    fill_in "Rent to", with: @tenant.rent_to
    fill_in "Surname", with: @tenant.surname
    click_on "Create Tenant"

    assert_text "Tenant was successfully created"
    click_on "Back"
  end

  test "updating a Tenant" do
    visit tenants_url
    click_on "Edit", match: :first

    fill_in "Account no", with: @tenant.account_no
    fill_in "Building", with: @tenant.building_id
    fill_in "Debt", with: @tenant.debt
    fill_in "Email", with: @tenant.email
    fill_in "Flat", with: @tenant.flat_id
    fill_in "Name", with: @tenant.name
    check "Paid" if @tenant.paid
    fill_in "Payment due", with: @tenant.payment_due
    fill_in "Phone", with: @tenant.phone
    fill_in "Rent from", with: @tenant.rent_from
    fill_in "Rent to", with: @tenant.rent_to
    fill_in "Surname", with: @tenant.surname
    click_on "Update Tenant"

    assert_text "Tenant was successfully updated"
    click_on "Back"
  end

  test "destroying a Tenant" do
    visit tenants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tenant was successfully destroyed"
  end
end
