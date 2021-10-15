class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  # def new
  # end
  #
  # def create
  #   order = Order.create({
  #     special_instructions: params[:order][:special_instructions],
  #     number_of_items: params[:order][:number_of_items],
  #     paid: params[:order][:paid]
  #     })
  #
  #   order.save
  #   redirect_to "/customers/#{customer.id}/orders"
  # end
end
