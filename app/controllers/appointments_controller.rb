class AppointmentsController < ApplicationController
  before_action :find_customer_pet
  before_action :find_doctors, only: [:new, :create]

  def show
    @appointment = @pet.appointments.find(params[:id])
    @doctor = Doctor.find(@appointment.doctor_id)
  end

  def new
    @appointment = @pet.appointments.new
  end

  def create
    @appointment = @pet.appointments.new(appointment_params)
    if @appointment.save
      flash[:success] = "New appointment created"
      redirect_to [@customer, @pet, @appointment]
    else
      flash.now[:error] = @appointment.errors.full_messages.to_sentence
      render action: :new
    end
  end

  private

  def find_customer_pet
    @customer = Customer.find(params[:customer_id])
    @pet = @customer.pets.find(params[:pet_id])
  end

  def find_doctors
    @doctors = Doctor.pluck(:name, :id)
  end

  def appointment_params
    params.require(:appointment).permit(:visit_date, :requires_reminder, :visit_reason, :doctor_id)
  end
end
