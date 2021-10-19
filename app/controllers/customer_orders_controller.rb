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
    new_order = @customer.orders.create(order_params)
    redirect_to "/customers/#{@customer.id}/orders"
  end

  def index_sorted
    @customer = Customer.find(params[:id])
  end

  private
    def order_params
      if params[:order][:paid] == 'Yes'
        params[:order][:paid] = true
      else 
        params[:order][:paid] = false
      end
      params.require(:order).permit(:special_instructions, :number_of_items, :paid)
    end
end
