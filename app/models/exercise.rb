class Exercise < ApplicationRecord
  belongs_to :lesson

  has_many :student_exercises, dependent: :destroy

  validates :title, presence: true, length: { maximum: 200 }
  validates :instructions, presence: true, length: { maximum: 2000 }
  validates :test_file_url, presence: true
  validates :public_test_file_url, presence: true
  validates :exercise_file_url, presence: true
  validates :point_value, presence: true, numericality: { min: 0 }

  def check_response?(response)
    print(response)
    print("\n")
  end
end
