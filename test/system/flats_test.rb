# frozen_string_literal: true

require 'application_system_test_case'

class FlatsTest < ApplicationSystemTestCase
  setup do
    @flat = flats(:one)
  end

  test 'visiting the index' do
    visit flats_url
    assert_selector 'h1', text: 'Flats'
  end

  test 'creating a Flat' do
    visit flats_url
    click_on 'New Flat'

    fill_in 'Building', with: @flat.building_id
    fill_in 'Debt', with: @flat.debt
    fill_in 'Door number', with: @flat.door_number
    fill_in 'Floor no', with: @flat.floor_no
    fill_in 'Rent', with: @flat.rent
    fill_in 'Rooms amount', with: @flat.rooms_amount
    fill_in 'Surface', with: @flat.surface
    check 'Taken' if @flat.taken
    fill_in 'Taken until', with: @flat.taken_until
    click_on 'Create Flat'

    assert_text 'Flat was successfully created'
    click_on 'Back'
  end

  test 'updating a Flat' do
    visit flats_url
    click_on 'Edit', match: :first

    fill_in 'Building', with: @flat.building_id
    fill_in 'Debt', with: @flat.debt
    fill_in 'Door number', with: @flat.door_number
    fill_in 'Floor no', with: @flat.floor_no
    fill_in 'Rent', with: @flat.rent
    fill_in 'Rooms amount', with: @flat.rooms_amount
    fill_in 'Surface', with: @flat.surface
    check 'Taken' if @flat.taken
    fill_in 'Taken until', with: @flat.taken_until
    click_on 'Update Flat'

    assert_text 'Flat was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Flat' do
    visit flats_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Flat was successfully destroyed'
  end
end
