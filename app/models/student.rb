class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable,
         :lockable

  include DeviseTokenAuth::Concerns::User
  include User

  before_validation do
    self.uid ||= email
  end

  belongs_to :organization
  has_one :profile, as: :viewable

  has_many :student_courses
  has_many :courses, through: :student_courses

  has_many :student_exercises
  has_many :exercises, through: :student_exercises

  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, format: Devise.email_regexp, uniqueness: true
end
