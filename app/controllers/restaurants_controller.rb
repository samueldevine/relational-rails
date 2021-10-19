class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = find_restaurant
  end

  def new
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
      if params[:restaurant][:liquor_license] == 'Yes'
        params[:restaurant][:liquor_license] = true
      else
        params[:restaurant][:liquor_license] = false
      end

      params.require(:restaurant).permit(:name, :liquor_license, :menu_items)
    end
end