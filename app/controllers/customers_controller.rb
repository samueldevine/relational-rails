class CustomersController < ApplicationController
  def index
    @customers = Customer.order(created_at: :desc)
  end

  def new
  end

  def create
    customer = Customer.new({
      first_name: params[:customer][:first_name],
      last_name: params[:customer][:last_name],
      address: params[:customer][:address],
      over_21: params[:customer][:over_21],
      rewards: params[:customer][:rewards]
      })

    customer.save
    redirect_to '/customers'
  end

  def show
    @customer = Customer.find(params[:id])
  end
end
