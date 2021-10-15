class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
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

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def update
    restaurant = Restaurant.find(params[:restaurant_id])
    restaurant.update({
      name:           params[:restaurant][:name],
      liquor_license: params[:restaurant][:liquor_license],
      menu_items:     params[:restaurant][:menu_items]
    })
    redirect_to "/restaurants/#{restaurant.id}"
  end
end