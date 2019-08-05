class Student < ApplicationRecord
  belongs_to :organization

  has_one :profile, as: :viewable
  has_one :user, as: :account

  has_many :student_courses
  has_many :courses, through: :student_courses

  has_many :submissions
end
