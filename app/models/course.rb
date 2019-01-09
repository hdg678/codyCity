class Course < ApplicationRecord
  belongs_to :organization
  belongs_to :developer

  has_many :lessons, dependent: :destroy
  has_many :student_courses, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
