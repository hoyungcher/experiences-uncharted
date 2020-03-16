class User < ApplicationRecord
  has_many :bookings
  validates :email, presence: true, uniqueness: true, format: { with: /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/ }
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
