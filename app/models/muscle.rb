class Muscle < ApplicationRecord
  belongs_to :user
  paginates_per(10)
  validates :benchpress, presence: true
  validates :squat, presence: true
  validates :chin_up, presence: true
  validates :deadlift, presence: true
end
