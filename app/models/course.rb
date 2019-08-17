class Course < ApplicationRecord
  belongs_to :organization
  has_and_belongs_to_many :developers
  has_and_belongs_to_many :students, join_table: :student_courses

  has_many :classroom

  has_many :lessons, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
