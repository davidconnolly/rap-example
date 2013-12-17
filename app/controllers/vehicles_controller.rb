class VehiclesController < ApplicationController
  before_action :build_vehicle, only: [ :new, :create ]
  before_action :load_vehicle, except: [ :index, :new, :create ]
  respond_to :json
  
  def index
    @vehicles = Vehicle.all
  end

  def new
  end

  def create
    @vehicle.save!

  #rescue ActiveRecord::RecordInvalid
  #  render_api_error('Invalid vehicle', @vehicle.errors)
  end

  def show
  end

  def edit
  end

  def update
    @vehicle.update_attributes!(vehicle_params)

  rescue ActiveRecord::RecordInvalid
    self.edit
    render(action: 'edit')
  end

  def destroy
    @vehicle.destroy
  end

private
  def build_vehicle
    @vehicle = Vehicle.new(vehicle_params)
  end

  def load_vehicle
    @vehicle = Vehicle.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    render(action: 'not_found', status: :not_found)
  end

  def vehicle_params
    params.require(:vehicle).permit(:make, :year, :customer_id)
  end 

end
