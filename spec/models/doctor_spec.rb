require 'rails_helper'

describe Doctor, type: :model do
  context "when invalid" do
    it "raises an error if name is empty" do
      expect { create(:doctor, name: nil) }.to raise_error ActiveRecord::RecordInvalid
    end

    it "raises an error if name is longer than 35 characters" do
      expect { create(:doctor, name: 'abcdefghijabcdefghijabcdefghijabcdef') }.
        to raise_error ActiveRecord::RecordInvalid
    end

    ['123456', 's1234', '1234'].each do |zip|
      it "raises an error if zip code is not 5 digits" do
        expect{ create(:doctor, zip: zip) }.to raise_error ActiveRecord::RecordInvalid
      end
    end

    [0, 100].each do |practice|
      it "raises an error if years of practice is invalid" do
        expect{ create(:doctor, years_of_practice: practice) }.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end
end
