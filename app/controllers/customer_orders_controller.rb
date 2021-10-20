class CustomerOrdersController < ApplicationController
  def index
    @customer = Customer.find(params[:id])
    if params[:sorted] == 'true'
      @order = @customer.sort_by_alphabet
    elsif params[:threshold]
      @order = @customer.orders.where('number_of_items > ?', params[:threshold])
    else
      @order = @customer.orders
    end
  end

  def new
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.find(params[:id])
    @customer.orders.create(order_params)
    redirect_to "/customers/#{@customer.id}/orders"
  end

  private
    def order_params
      params.permit(:special_instructions, :number_of_items, :paid)
    end
end
