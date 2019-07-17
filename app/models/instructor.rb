class Instructor < ApplicationRecord
  belongs_to :organization
  has_one :profile, as: :viewable
  has_one :user, as: :account

  has_many :student_exercises
  has_many :exercises, through: :student_exercises
end
