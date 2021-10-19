class RestaurantEmployeesController < ApplicationController
  def index
    @restaurant = find_restaurant
  end

  def new
    @restaurant = find_restaurant
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
      if params[:employee][:currently_employed] == 'Yes'
        params[:employee][:currently_employed] = true
      else
        params[:employee][:currently_employed] = false
      end

      params.require(:employee).permit(:first_name, :last_name, :currently_employed, :wage)
    end
end
