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
    redirect_to "/customers/#{params[:customer_id]}/orders"
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update({
      special_instructions: params[:special_instructions],
      number_of_items: params[:number_of_items],
      paid: params[:paid]
      })
    order.save
    redirect_to "/orders/#{order.id}"
  end
end
