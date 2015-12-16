FactoryGirl.define do
  factory :pet do
    name "Tommy"
    pet_type "dog"
    breed "labrador"
    age 5
    weight "50"
    last_visit Date.today
    association :customer, strategy: :build
  end

end
