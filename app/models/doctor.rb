class Doctor < ActiveRecord::Base
  has_many :appointments
  has_many :pets, through: :appointments

  # Validations
  validates :name, presence: true, length: { maximum: 35 }
  validates :zip, format: { with: /\A\d{5}\z/ }
  validates :years_of_practice, numericality: { greater_than_or_equal_to: 1, 
                                                less_than: 100 }
end

