require_relative '../json_schema'
require_relative '../test_helper'

class CustomersControllerTest < ActionController::TestCase

  def test_show
    customer = a Customer

    get :show, :format => :json, 
      id: customer.id
    
    assert_response :success
  end

  def test_content
    customer = a Customer
    customer.update_attributes(name: 'Example')

    get :show, :format => :json, 
      id: customer.id

    assert_response :success
    assert_equal customer.name, 'Example'
  end

  def test_index
    customers = 5.of { a Customer }

    get :index, :format => :json

    assert_response :success

    response = parse_json_response

    assert_instance_of Hash, response
    assert JSON::Validator.validate(CUSTOMERS_INDEX_SCHEMA, response)    
    assert_equal 1, response.length
    assert_equal 5, response['customers'].length
  end

  def test_create
    post :create, :format => :json, 
        customer: {
           name: 'Foo'
        }

    assert_response :success

    response = parse_json_response

    assert response['customers']
  end

  def test_update
    old_name = 'Foo'
    new_name = 'Bar'

    customer = Customer.create(
      name: old_name
    )

    patch :update, :format => :json, 
      id: customer.id,
        customer: {
        name: new_name
    }

    assert_response :success

    response = parse_json_response

    customer.reload

    assert_equal new_name, response['name']
    assert_equal new_name, customer.name
  end
  
end
