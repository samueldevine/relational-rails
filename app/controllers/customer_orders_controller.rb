class CustomerOrdersController < ApplicationController
  def index
    @customer = Customer.find(params[:id])
    if params[:sorted] == 'true'
      @order = @customer.sort_by_alphabet
    else
      @order = @customer.orders.where('number_of_items > ?', params[:threshold])
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

  # def index_sorted
  #   @customer = Customer.find(params[:id])
  # end

  private
    def order_params
      if params[:order][:paid] == 'true'
        params[:order][:paid] = true
      else
        params[:order][:paid] = false
      end
      params.require(:order).permit(:special_instructions, :number_of_items, :paid)
    end
end
