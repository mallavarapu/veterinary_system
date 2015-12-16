class Customer < ActiveRecord::Base
  has_many :pets
  validates :name, :email, presence: true
end
