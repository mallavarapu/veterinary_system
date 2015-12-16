class PetsController < ApplicationController
  before_action :find_customer, only: [:index, :show, :create, :new]

  def index
    @pets = @customer.pets
  end

  def new
    @pet = @customer.pets.new
    @pet_types = Pet::PET_TYPES.map { |p| [p,p] }
  end

  def create
    @pet = @customer.pets.new(pet_params)
    if @pet.save
      flash[:notice] = "New pet created!"
      redirect_to [@customer, @pet]
    else
      flash.now[:error] = @pet.errors.full_messages.to_sentence
      @pet_types = Pet::PET_TYPES.map { |p| [p,p] }
      render action: :new
    end
  end

  def show
    @pet = @customer.pets.find(params[:id])
  end

  private

  def find_customer
    @customer = Customer.find(params[:customer_id])
  end

  def pet_params
    params.require(:pet).permit(:name, :pet_type, :breed, :age, :weight, :last_visit)
  end
end
