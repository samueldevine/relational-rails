class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
  end

  def create
    Customer.create(customer_params)
    redirect_to '/customers'
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to "/customers/#{customer.id}"
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
    Customer.destroy(params[:id])
    redirect_to '/customers'
  end

  private
    def customer_params
      if params[:customer][:over_21] == 'true'
        params[:customer][:over_21] = true
      else
        params[:customer][:over_21] = false
      end
      params.require(:customer).permit(:first_name, :last_name, :address, :over_21, :rewards)
    end
end
