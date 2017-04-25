class Injury < ApplicationRecord
  paginates_per(10)
  validates :part, presence: true
end
