class Host < ApplicationRecord
  has_many :bookings
  has_many :activities
  validates :email, presence: true, uniqueness: true, format: { with: /\A\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}\z/ }
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
