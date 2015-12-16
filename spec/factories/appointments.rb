FactoryGirl.define do
  factory :appointment do
    association :pet, strategy: :build
    association :doctor, strategy: :build
    visit_date Date.today
    requires_reminder false
    visit_reason "Infection"
  end

end
