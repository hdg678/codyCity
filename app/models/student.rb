class Student < ApplicationRecord
  belongs_to :organization

  has_one :profile, as: :viewable

  has_many :student_courses
  has_many :courses, through: :student_courses

  has_many :student_exercises
  has_many :exercises, through: :student_exercises
end
