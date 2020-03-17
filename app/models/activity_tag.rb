class ActivityTag < ApplicationRecord
  belongs_to :activity
  belongs_to :tag
  validates :activity, presence: true
  validates :tag, presence: true
end
