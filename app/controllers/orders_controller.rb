class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def create
    order = Order.new({
      special_instructions: params[:special_instructions],
      number_of_items: params[:number_of_items],
      paid: params[:paid]
      })
    order.save
    # redirect_to "/orders"
  end

  def edit
    @order = Order.find(params[:id])
  end

end
