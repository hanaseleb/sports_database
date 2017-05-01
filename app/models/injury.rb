class Injury < ApplicationRecord
  paginates_per(10)
  belongs_to :user
  validates :part, presence: true
end
