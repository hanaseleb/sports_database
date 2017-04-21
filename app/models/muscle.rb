class Muscle < ApplicationRecord
  belongs_to :user
  paginates_per(10)
end
