class Instructor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :registerable

  include DeviseTokenAuth::Concerns::User
  include User

  belongs_to :organization
  has_one :profile, as: :viewable

  has_many :student_exercises
  has_many :exercises, through: :student_exercises
end
