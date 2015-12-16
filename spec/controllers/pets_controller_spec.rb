require 'rails_helper'

describe PetsController, type: :controller do

  describe 'POST #create' do
    context "with valid attributes" do
      before {
        @customer = create(:customer)
        post :create, customer_id: @customer.id, pet: attributes_for(:pet, 
                                                                     customer_id: @customer.id)
      }
      it "creates a new pet" do
        expect(@customer.pets.count).to eq 1
      end

      it "redirects to the pet page" do
        expect(response).to redirect_to [@customer, @customer.pets.first]
      end
    end

    context "with invalid attributes" do
      before {
        @customer = create(:customer)
        post :create, customer_id: @customer.id, pet: attributes_for(:pet, name: nil)
      }
      it "does not create a new pet" do
        expect(@customer.pets.count).to eq 0
      end

      it "renders the new template" do
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #new' do
    it "renders the new template for pets" do
      customer = create(:customer)
      get :new, customer_id: customer.id
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    before {
      @customer = create(:customer)
    }
    it "shows the pet for valid id" do
      pet = create(:pet, customer_id: @customer.id)
      get :show, customer_id: @customer.id, id: pet.id
      expect(response).to render_template :show
    end

    it "raises a record not found exception for invalid id" do
      expect{get :show, customer_id: @customer.id, id: 0 }.
        to raise_error ActiveRecord::RecordNotFound
    end
  end
end
