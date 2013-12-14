require_relative '../test_helper'

class CustomerTest < ActiveSupport::TestCase
  def test_create_defaults
    customer = Customer.create(
      name: "TestName"      
    )
    
    assert_created customer

    assert_equal 0, customer.vehicles.count
    assert_equal 0, customer.invoices.count
    assert_equal 0, customer.estimates.count
  end
  
  def test_create_requirements
    customer = Customer.create

    assert_not_created customer
    assert_errors_on customer, :name
  end

  def test_create_dummy
    customer = a Customer

    assert_created customer

    assert_equal 0, customer.vehicles.count
    assert_equal 0, customer.invoices.count
    assert_equal 0, customer.estimates.count
  end

  def test_add_vehicle
    customer = a Customer
    vehicle = customer.vehicles.create_dummy
    
    assert_equal 1, customer.vehicles.count
    
    assert_equal customer.vehicles.first.id, vehicle.id
    assert_equal customer.vehicles.first.customer.id, customer.id
  end

end
