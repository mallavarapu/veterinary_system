require 'rails_helper'

describe DoctorsController, type: :controller do
  describe 'GET #show' do
    it "shows the doctor for valid id" do
      doctor = create(:doctor)
      get :show, id: doctor.id
      expect(response).to render_template :show
    end

    it "raises a record not found exception for invalid id" do
      expect { get :show, id: 0 }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe 'GET #index' do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

end
