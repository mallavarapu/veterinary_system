require 'rails_helper'

describe CustomersController, type: :controller do
  describe 'POST #create' do
    context "with valid attributes" do
      it "creates a new customer" do
        post :create, customer: attributes_for(:customer)
        expect(Customer.count).to eq(1)
      end

      it "redirects to the customer page" do
        post :create, customer: attributes_for(:customer)
        expect(response).to redirect_to(Customer.first)
      end
    end

    context "with invalid attributes" do
      it "does not create a customer" do
        post :create, customer: attributes_for(:customer, name: nil)
        expect(Customer.count).to eq(0)
      end

      it "redirects to the customer page" do
        post :create, customer: attributes_for(:customer, name: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    it "shows the customer for valid id" do
      customer = create(:customer)
      get :show, id: customer.id
      expect(response).to render_template :show
    end

    it "raises a record not found exception for invalid id" do
      expect { get :show, id: 0 }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe 'GET #new' do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #index' do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

end
