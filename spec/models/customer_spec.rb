require 'rails_helper'

describe Customer, type: :model do
  ["name", "email"].each do |attr|
    it "is invalid without a #{attr}" do
      customer = build(:customer, attr.to_sym => nil)
      expect(customer.valid?).to be false
    end
  end
end
