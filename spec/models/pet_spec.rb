require 'rails_helper'

describe Pet, type: :model do
  context "when not valid" do
    ["name", "breed"].each do |attr|
      it "raises an error for an empty #{attr}" do
        expect {create(:pet, attr.to_sym => nil)}.to raise_error ActiveRecord::RecordInvalid
      end

      it "raises an error for #{attr} longer than 35 characters" do
        expect {create(:pet, attr.to_sym => 'abcdefghijabcdefghijabcdefghijabcdefghij')}.to raise_error ActiveRecord::RecordInvalid
      end
    end

    ["age", "weight", "pet_type", "last_visit"].each do |attr|
      it "raises an error for an empty #{attr}" do
        expect {create(:pet, attr.to_sym => nil)}.to raise_error ActiveRecord::RecordInvalid
      end
    end

    ["fish", "deer", "lion"].each do |animal|
      it "raises an error for an invalid animal" do
        expect {create(:pet, pet_type: animal)}.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end

  context "when valid" do
    ["dog", "cat", "bird"].each do |pet_type|
      it "creates a new pet for valid pet types" do
        expect {create(:pet, pet_type: pet_type)}.not_to raise_error
      end
    end

    it "creates a new pet for valid names" do
      expect {create(:pet, name: "Tommy") }.not_to raise_error
    end
  end
end
