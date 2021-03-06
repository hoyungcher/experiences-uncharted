class Activity < ApplicationRecord
  belongs_to :host
  has_many :bookings
  has_many :users, through: :bookings
  has_many :activity_tags
  has_many :tags, through: :activity_tags
  has_many :reviews, through: :bookings

  validates :host, presence: true
end
