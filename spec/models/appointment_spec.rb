require 'rails_helper'

describe Appointment, type: :model do
  context "when not valid" do
    [:pet_id, :doctor_id, :visit_date, :visit_reason].each do |attr|
      it "raises an error for empty #{attr}" do
        expect { create(:appointment, attr => nil) }.to raise_error ActiveRecord::RecordInvalid
      end
    end

    it "raises an error for visit date in the past" do
      expect { create(:appointment, visit_date: (Date.today - 1)) }.to raise_error ActiveRecord::RecordInvalid
    end

  end

  context "when valid" do
    it "does not raise an error for valid attributes" do
      expect { create(:appointment) }.not_to raise_error
    end
  end
end
