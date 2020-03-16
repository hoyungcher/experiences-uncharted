class Booking < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  belongs_to :host
  validates :date, presence: true, uniqueness: { scope: :host_id }
  validates :activity, presence: true
  validates :user, presence: true
  validates :host, presence: true
end
