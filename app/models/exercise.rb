class Exercise < ApplicationRecord
  belongs_to :lesson

  has_many :student_exercises, dependent: :destroy

  validates :title, presence: true
  validates :point_value, presence: true, numericality: { min: 0 }
end
