class CustomerOrdersController < ApplicationController
  def index
    @customer = Customer.find(params[:id])
    @order = Order.where(customer_id: @customer.id)
  end
end
