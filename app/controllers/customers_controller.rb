class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
  end

  def create
    customer = Customer.new({
      first_name: params[:customer][:first_name],
      last_name: params[:customer][:last_name],
      address: params[:customer][:address],
      over_21: params[:customer][:over_21],
      })

    customer.save
    redirect_to '/customers'
  end

  def show
    @customer = Customer.find(params[:id])
  end
end
