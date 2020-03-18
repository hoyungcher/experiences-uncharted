class Host < ApplicationRecord
  has_many :bookings
  has_many :activities

  validates :email, presence: true, uniqueness: true, format: { with: /\A\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}\z/ }
  validates :encrypted_password, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
end
