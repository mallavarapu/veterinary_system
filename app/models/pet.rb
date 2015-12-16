class Pet < ActiveRecord::Base
  belongs_to :customer
  has_many :appointments
  has_many :doctors, through: :appointments
  # Validations
  validates :name, :breed, presence: true, length: { maximum: 35 }
  validates :pet_type, presence: true, inclusion: { in: %w(dog cat bird) }
  validates :age, :weight, :last_visit, presence: true
end
