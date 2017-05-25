class CustomersController < ApplicationController
  before_action :set_customer, only: [:destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)

    respond_to do |f|
      if @customer.save
        f.json { head :no_content }
        f.js
      else
        f.json { head :bad_request }
      end
    end
  end

  def destroy
    @customer.destroy

    respond_to do |f|
      f.js
      f.json { head :no_content}
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :value)
  end
end
