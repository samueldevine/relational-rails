class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def show_employees
        @restaurant = Restaurant.find(params[:id])
        binding.pry
        # how to access employees of a restaurant?
    end
end