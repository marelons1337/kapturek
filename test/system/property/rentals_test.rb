require "application_system_test_case"

class Property::RentalsTest < ApplicationSystemTestCase
  setup do
    @property_rental = property_rentals(:one)
  end

  test "visiting the index" do
    visit property_rentals_url
    assert_selector "h1", text: "Rentals"
  end

  test "should create rental" do
    visit property_rentals_url
    click_on "New rental"

    fill_in "Account", with: @property_rental.account_id
    fill_in "Bought at", with: @property_rental.bought_at
    fill_in "Building", with: @property_rental.building_id
    fill_in "Buy price", with: @property_rental.buy_price
    fill_in "City", with: @property_rental.city
    fill_in "Country", with: @property_rental.country
    fill_in "Door no", with: @property_rental.door_no
    fill_in "Floor no", with: @property_rental.floor_no
    fill_in "Name", with: @property_rental.name
    fill_in "Rent", with: @property_rental.rent
    fill_in "Rooms amount", with: @property_rental.rooms_amount
    fill_in "Sale price", with: @property_rental.sale_price
    fill_in "Street", with: @property_rental.street
    fill_in "Street no", with: @property_rental.street_no
    fill_in "Surface", with: @property_rental.surface
    fill_in "Taken from", with: @property_rental.taken_from
    fill_in "Taken until", with: @property_rental.taken_until
    click_on "Create Rental"

    assert_text "Rental was successfully created"
    click_on "Back"
  end

  test "should update Rental" do
    visit property_rental_url(@property_rental)
    click_on "Edit this rental", match: :first

    fill_in "Account", with: @property_rental.account_id
    fill_in "Bought at", with: @property_rental.bought_at
    fill_in "Building", with: @property_rental.building_id
    fill_in "Buy price", with: @property_rental.buy_price
    fill_in "City", with: @property_rental.city
    fill_in "Country", with: @property_rental.country
    fill_in "Door no", with: @property_rental.door_no
    fill_in "Floor no", with: @property_rental.floor_no
    fill_in "Name", with: @property_rental.name
    fill_in "Rent", with: @property_rental.rent
    fill_in "Rooms amount", with: @property_rental.rooms_amount
    fill_in "Sale price", with: @property_rental.sale_price
    fill_in "Street", with: @property_rental.street
    fill_in "Street no", with: @property_rental.street_no
    fill_in "Surface", with: @property_rental.surface
    fill_in "Taken from", with: @property_rental.taken_from
    fill_in "Taken until", with: @property_rental.taken_until
    click_on "Update Rental"

    assert_text "Rental was successfully updated"
    click_on "Back"
  end

  test "should destroy Rental" do
    visit property_rental_url(@property_rental)
    click_on "Destroy this rental", match: :first

    assert_text "Rental was successfully destroyed"
  end
end
