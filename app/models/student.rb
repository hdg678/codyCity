class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable,
         :lockable

  include DeviseTokenAuth::Concerns::User

  belongs_to :organization
  has_one :profile, as: :viewable

  has_many :student_courses
  has_many :courses, through: :student_courses

  has_many :student_exercises
  has_many :exercises, through: :student_exercises
end
