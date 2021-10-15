class CustomerOrdersController < ApplicationController
  def index
    @customer = Customer.find(params[:id])
    @order = Order.where(customer_id: @customer.id)
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
    redirect_to "/orders"
  end
end
