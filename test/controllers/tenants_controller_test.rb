# frozen_string_literal: true

require 'test_helper'

class TenantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tenant = tenants(:no_debt)
  end

  test 'should get index' do
    get tenants_url
    assert_response :success
  end

  test 'should get new' do
    get new_tenant_url
    assert_response :success
  end

  test 'should create tenant' do
    building = buildings(:one)
    flat = flats(:one)
    tenant = Tenant.new(account_no: 123123123, building_id: building.id, debt: 0, email: "jeden@email.pl",
                        flat_id: flat.id, name: "elo", paid: true, payment_due: Date.today, phone: 1283123123,
                        rent_from: Date.today - 1.month, rent_to: Date.today + 1.month, surname: "elosa")
    assert_difference('Tenant.count') do
      post tenants_url,
           params: { tenant: { account_no: tenant.account_no, building_id: tenant.building_id, debt: tenant.debt,
                               email: tenant.email, flat_id: tenant.flat_id, name: tenant.name, paid: tenant.paid,
                               payment_due: tenant.payment_due, phone: tenant.phone, rent_from: tenant.rent_from,
                                rent_to: tenant.rent_to, surname: tenant.surname } }
    end

    assert_redirected_to tenant_url(Tenant.last)
  end

  test 'should show tenant' do
    get tenant_url(@tenant)
    assert_response :success
  end

  test 'should get edit' do
    get edit_tenant_url(@tenant)
    assert_response :success
  end

  test 'should update tenant' do
    building = buildings(:one)
    flat = flats(:three)
    tenant = Tenant.new(account_no: 123123123, building_id: building.id, debt: 0, email: "jeden@email.pl",
      flat_id: flat.id, name: "elo", paid: true, payment_due: Date.today, phone: 1283123123,
      rent_from: Date.today - 1.month, rent_to: Date.today + 1.month, surname: "elosa")
    patch tenant_url(@tenant),
          params: { tenant: { account_no: tenant.account_no, building_id: tenant.building_id, debt: tenant.debt,
                              email: tenant.email, flat_id: flat.id, name: tenant.name, paid: tenant.paid,
                              payment_due: tenant.payment_due, phone: tenant.phone, rent_from: tenant.rent_from,
                               rent_to: tenant.rent_to, surname: tenant.surname } }
    assert_redirected_to tenant_url(@tenant)
  end

  test 'should destroy tenant' do
    assert_difference('Tenant.count', -1) do
      delete tenant_url(@tenant)
    end

    assert_redirected_to tenants_url
  end
end
