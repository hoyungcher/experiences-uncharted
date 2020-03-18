class Booking < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  belongs_to :host
  has_many :reviews

  validates :date, presence: true, uniqueness: { scope: :host_id }
  validates :activity, presence: true
  validates :user, presence: true
  validates :host, presence: true
  validates :group_size, presence: true, inclusion: { in: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    message: "%{value} is over max group size" }
end
