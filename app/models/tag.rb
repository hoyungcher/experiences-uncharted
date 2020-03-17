class Tag < ApplicationRecord
  has_many :activities, through: :activity_tags
  validates :name, presence: true
end
