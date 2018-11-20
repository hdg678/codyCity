class StudentExercise < ApplicationRecord
  belongs_to :exercise
  belongs_to :student
  belongs_to :instructor
end
