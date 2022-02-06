# frozen_string_literal: true

require 'test_helper'

class TenantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tenant = tenants(:one)
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
    assert_difference('Tenant.count') do
      post tenants_url,
           params: { tenant: { account_no: @tenant.account_no, building_id: @tenant.building_id, debt: @tenant.debt,
                               email: @tenant.email, flat_id: @tenant.flat_id, name: @tenant.name, paid: @tenant.paid, payment_due: @tenant.payment_due, phone: @tenant.phone, rent_from: @tenant.rent_from, rent_to: @tenant.rent_to, surname: @tenant.surname } }
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
    patch tenant_url(@tenant),
          params: { tenant: { account_no: @tenant.account_no, building_id: @tenant.building_id, debt: @tenant.debt,
                              email: @tenant.email, flat_id: @tenant.flat_id, name: @tenant.name, paid: @tenant.paid, payment_due: @tenant.payment_due, phone: @tenant.phone, rent_from: @tenant.rent_from, rent_to: @tenant.rent_to, surname: @tenant.surname } }
    assert_redirected_to tenant_url(@tenant)
  end

  test 'should destroy tenant' do
    assert_difference('Tenant.count', -1) do
      delete tenant_url(@tenant)
    end

    assert_redirected_to tenants_url
  end
end
