class Submission < ApplicationRecord
  belongs_to :student
  belongs_to :exercise
end
