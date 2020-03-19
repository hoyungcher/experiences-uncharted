class AvailableDate < ApplicationRecord
  belongs_to :host
  validates :date, presence: true, uniqueness: { scope: :host_id }
  validates :host, presence: true

end
