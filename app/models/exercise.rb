class Exercise < ApplicationRecord
  belongs_to :lesson

  has_many :student_exercises, dependent: :destroy

  validates :title, presence: true
  validates :point_value, presence: true, numericality: { min: 0 }

  # Files stored using active storage
  has_one_attached :test_file
  has_one_attached :exercise_file
end
