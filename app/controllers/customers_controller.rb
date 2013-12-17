class CustomersController < ApplicationController
  before_action :build_customer, only: [ :new, :create ]
  before_action :load_customer, except: [ :index, :new, :create ]
  respond_to :json

  def index
    @customers = Customer.all
  end

  def new
  end

  def create
    @customer.save!

  #rescue ActiveRecord::RecordInvalid
  #  render_api_error('Invalid customer', @customer.errors)
  end

  def show
  end

  def edit
  end

  def update
    @customer.update_attributes!(customer_params)

  rescue ActiveRecord::RecordInvalid
    self.edit
    render(action: 'edit')
  end

  def destroy
    @customer.destroy
  end

private
  def build_customer
    @customer = Customer.new(customer_params)
  end

  def load_customer
    @customer = Customer.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    render(action: 'not_found', status: :not_found)
  end

  def customer_params
    params.require(:customer).permit(:name)
  end
  
end
