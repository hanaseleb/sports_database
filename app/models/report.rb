class Report < ApplicationRecord
  belongs_to :user
  paginates_per(10)
  validates :weight, presence: true
  validates :weight, numericality: {:less_than => 160, :greater_than => 30}
  validates :sleep, presence: true
  validates :nausea, presence: true
end
