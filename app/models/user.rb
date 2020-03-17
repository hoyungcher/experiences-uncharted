class User < ApplicationRecord
  has_many :bookings
  validates :email, presence: true, uniqueness: true, format: { with: /\A\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}\z/ }
  validates :encrypted_password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
