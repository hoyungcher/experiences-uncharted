class ActivityTag < ApplicationRecord
  belongs_to :activity
  belongs_to :tag
  has_many :reviews, through: :bookings

  validates :activity, presence: true
  validates :tag, presence: true
end
