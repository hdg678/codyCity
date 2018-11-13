class Exercise < ApplicationRecord
  belongs_to :lesson

  validates :title, presence: true
  validates :point_value, presence: true, numericality: { min: 0 }
end
