class RestaurantEmployeesController < ApplicationController
  def index
    @restaurant = find_restaurant
  end

  def new
    @restaurant = find_restaurant
  end

  def create
    restaurant = find_restaurant
    restaurant.employees.create({
      first_name:         params[:employee][:first_name],
      last_name:          params[:employee][:last_name],
      currently_employed: params[:employee][:currently_employed],
      wage:               params[:employee][:wage]
    })
    redirect_to "/restaurants/#{restaurant.id}/employees"
  end

  def index_sorted
    @restaurant = find_restaurant
  end

  private
    def find_restaurant
      Restaurant.find(params[:restaurant_id])
    end

    def employee_params
      {
        first_name:         params[:employee][:first_name],
        last_name:          params[:employee][:last_name],
        currently_employed: params[:employee][:currently_employed],
        wage:               params[:employee][:wage]
      }

      params.require(:employee).permit(:first_name, :last_name, :currently_employed, :wage)
    end
end