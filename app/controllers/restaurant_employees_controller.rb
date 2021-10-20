class RestaurantEmployeesController < ApplicationController
  def index
    @restaurant = find_restaurant
  end

  def new
    @restaurant = find_restaurant
    @employee = @restaurant.employees.new
  end

  def create
    restaurant = find_restaurant
    restaurant.employees.create(employee_params)
    redirect_to "/restaurants/#{restaurant.id}/employees"
  end

  private
    def find_restaurant
      Restaurant.find(params[:restaurant_id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :currently_employed, :wage)
    end
end
