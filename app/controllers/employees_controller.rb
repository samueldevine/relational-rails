class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def by_restaurant
        @restaurant = Restaurant.find(params[:id])
        @employees = Employee.where(restaurant_id: @restaurant.id)
    end
end