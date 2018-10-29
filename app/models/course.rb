class Course < ApplicationRecord


	has_and_belongs_to_many :developers

	has_and_belongs_to_many :students

	has_and_belongs_to_many :instructors

	has_many :lessons

end
