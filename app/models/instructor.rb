class Instructor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :registerable#,
         #:jwt_authenticatable, jwt_revocation_strategy: JWTBlacklist
         

  belongs_to :organization
  has_one :profile, as: :viewable

  has_many :student_exercises
  has_many :exercises, through: :student_exercises
end
