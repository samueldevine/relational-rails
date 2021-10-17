class RestaurantEmployeesController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    new_ee = @restaurant.employees.create!({
      first_name:         params[:employee][:first_name],
      last_name:          params[:employee][:last_name],
      currently_employed: params[:employee][:currently_employed],
      wage:               params[:employee][:wage]
    })
    new_ee.save
    redirect_to "/restaurants/#{@restaurant.id}/employees"
  end
end