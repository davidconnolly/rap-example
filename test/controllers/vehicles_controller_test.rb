require_relative '../test_helper'

class VehiclesControllerTest < ActionController::TestCase

  def test_show
    vehicle = a Vehicle

    get :show, :format => :json, 
      id: vehicle.id

    assert_response :success
  end

  def test_content
    vehicle = a Vehicle
    vehicle.update_attributes(make: 'Example')

    get :show, :format => :json, 
      id: vehicle.id

    assert_response :success
    assert_equal vehicle.make, 'Example'
  end
  
  def test_index
    vehicles = 5.of { a Vehicle }

    get :index, :format => :json, 

    assert_response :success

    response = parse_json_response

    assert_instance_of Array, response
    assert_equal vehicles.length, response.length
    assert_equal vehicles.first.id, response.first['id']
  end

  def test_create
    customer = a Customer

    post :create, :format => :json, 
        vehicle: {
          make: 'Foo',
          year: 1980,
          customer_id: customer.id
        }

    assert_response :success

    response = parse_json_response

    assert response['make']
  end

  def test_update
    customer = a Customer
    old_make = 'Foo'
    new_make = 'Bar'

    vehicle = Vehicle.create(
      make: old_make,
      year: 2013,
      customer: customer
    )
    
    patch :update, :format => :json, 
      id: vehicle.id,
        vehicle: {
        make: new_make
    }

    assert_response :success

    response = parse_json_response

    vehicle.reload

    assert_equal new_make, response['make']
    assert_equal new_make, vehicle.make
  end
end
