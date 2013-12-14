require_relative '../test_helper'

class VehicleTest < ActiveSupport::TestCase
  def test_create_defaults
    customer = a Customer

    vehicle = Vehicle.create(
      make: "TestMake",
      year: 1980,
      customer: customer
    )

    assert_created vehicle
    assert_created vehicle.customer
    
    assert_equal 0, vehicle.problems.count
  end
  
  def test_create_requirements
    vehicle = Vehicle.create

    assert_not_created vehicle
    assert_errors_on vehicle, :customer, :make, :year
  end

  def test_create_dummy
    vehicle = a Vehicle

    assert_created vehicle
    assert_created vehicle.customer
    assert_equal 0, vehicle.problems.count
  end

  def test_add_problem
    vehicle = a Vehicle
    problem = vehicle.problems.create_dummy

    assert_equal 1, vehicle.problems.count
    
    assert_equal vehicle.problems.first.id, problem.id
    assert_equal vehicle.problems.first.vehicle.id, vehicle.id
  end
  
end
