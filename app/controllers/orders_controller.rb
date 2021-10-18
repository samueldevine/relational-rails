class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to "/orders/#{order.id}"
  end

  private
    def order_params
      if params[:order][:paid] == 'Yes'
        params[:order][:paid] = true
      end
      params.require(:order).permit(:special_instructions, :number_of_items, :paid)
    end
end
