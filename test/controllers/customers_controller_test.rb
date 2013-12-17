require_relative '../test_helper'

class CustomersControllerTest < ActionController::TestCase

  def test_show
    customer = a Customer

    get :show,
      id: customer.id
    
    assert_response :success
  end

  def test_content
    customer = a Customer
    customer.update_attributes(name: 'Example')

    get :show,
      id: customer.id

    assert_response :success
    assert_equal customer.name, 'Example'
  end

  def test_index
    customers = 5.of { a Customer }

    get :index

    assert_response :success

    response = parse_json_response

    assert_instance_of Array, response
    assert_equal customers.length, response.length
    assert_equal customers.first.id, response.first['id']
  end

  def test_create
    post :create,
        customer: {
           name: 'Foo'
        }

    assert_response :success

    response = parse_json_response

    assert response['name']
  end

  def test_update
    old_name = 'Foo'
    new_name = 'Bar'

    customer = Customer.create(
      name: old_name
    )

    patch :update,
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
