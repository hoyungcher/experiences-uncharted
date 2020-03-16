class Activity < ApplicationRecord
  belongs_to :host
  has_many :bookings
  has_many :users, through: :bookings
end
