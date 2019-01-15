class Course < ApplicationRecord
  belongs_to :organization
  belongs_to :developer

  has_many :lessons, dependent: :destroy
  has_many :student_courses, dependent: :destroy
  has_many :students, through: :student_courses

  validates :title, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :image_url, presence: true
end
