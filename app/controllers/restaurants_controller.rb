class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = find_restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant = Restaurant.create(restaurant_params)
    redirect_to '/restaurants'
  end

  def edit
    @restaurant = find_restaurant
  end

  def update
    restaurant = Restaurant.find(params[:restaurant_id])
    restaurant.update(restaurant_params)
    redirect_to "/restaurants/#{restaurant.id}"
  end

  def destroy
    Restaurant.destroy(params[:restaurant_id])
    redirect_to '/restaurants'
  end

  private
    def find_restaurant
      Restaurant.find(params[:restaurant_id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :liquor_license, :menu_items)
    end
end
