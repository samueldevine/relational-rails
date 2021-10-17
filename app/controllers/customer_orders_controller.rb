class CustomerOrdersController < ApplicationController
  def index
    @customer = Customer.find(params[:id])
    @order = Order.where(customer_id: @customer.id)
  end

  def new
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.find(params[:id])
    new_order = @customer.orders.create!({
      special_instructions: params[:order][:special_instructions],
      number_of_items: params[:order][:number_of_items],
      paid: params[:order][:paid]
      })
    new_order.save
    redirect_to "/customers/#{@customer.id}/orders"
  end
end
