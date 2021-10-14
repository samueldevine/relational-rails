class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def by_customer
    @order = Order.find(params[:customer_id])
  end
end
