require 'rails_helper'

describe AppointmentsController, type: :controller do

  describe 'POST #create' do
    context "with valid attributes" do
      before {
        @doctor = create(:doctor)
        @customer = create(:customer)
        @pet = create(:pet, customer_id: @customer.id)
        post :create, customer_id: @customer.id, doctor_id: @doctor.id, 
          pet_id: @pet.id, appointment: attributes_for(:appointment, 
                                                       doctor_id: @doctor.id, pet_id: @pet.id)
      }
      it "creates a new appointment" do
        expect(@pet.appointments.count).to eq 1
      end

      it "redirects to the appointment page" do
        expect(response).to redirect_to [@customer, @pet, @pet.appointments.first]
      end
    end

    context "with invalid attributes" do
      before {
        @doctor = create(:doctor)
        @customer = create(:customer)
        @pet = create(:pet, customer_id: @customer.id)
        post :create, customer_id: @customer.id, doctor_id: @doctor.id, pet_id: @pet.id,
          appointment: attributes_for(:appointment, 
                                      doctor_id: @doctor.id, pet_id: @pet.id, 
                                      visit_date: Date.today - 1)
      }
      it "does not create a new appointment" do
        expect(@pet.appointments.count).to eq 0
      end

      it "renders the new template" do
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    before {
      @customer = create(:customer)
      @doctor = create(:doctor)
      @pet = create(:pet, customer_id: @customer.id)
    }

    it "shows the appointment page for a valid id" do
      appointment = create(:appointment, doctor_id: @doctor.id, pet_id: @pet.id)
      get :show, customer_id: @customer.id, pet_id: @pet.id, id: appointment.id
      expect(response).to render_template :show
    end

    it "raises a record not found exception for invalid id" do
      expect{get :show, customer_id: @customer.id, pet_id: @pet.id, id: 0}.
        to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe 'GET #new' do
    it "renders the new template" do
      @customer = create(:customer)
      @pet = create(:pet, customer_id: @customer.id)
      get :new, customer_id: @customer.id, pet_id: @pet.id
      expect(response).to render_template :new
    end
  end

end
