class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = "New customer created"
      redirect_to @customer
    else
      flash.now[:error] = @customer.errors.full_messages.to_sentence
      render action: :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end
end
