class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
  end
  
  def create
    restaurant = Restaurant.new({
      name:           params[:restaurant][:name],
      liquor_license: params[:restaurant][:liquor_license],
      menu_items:     params[:restaurant][:menu_items]
    })
    restaurant.save
    redirect_to '/restaurants'
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end