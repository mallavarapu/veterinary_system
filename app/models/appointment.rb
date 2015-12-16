class Appointment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :doctor
  # Validations
  validates :doctor, :pet, presence: true
  validates :visit_date, :visit_reason, presence: true
  # Custom validation to check if visit date is in the past
  validate :visit_date_in_future

  private
  def visit_date_in_future
    if visit_date && visit_date < Date.today
      errors.add(:visit_date, "Appointment date cannot be in the past")
    end
  end
end
