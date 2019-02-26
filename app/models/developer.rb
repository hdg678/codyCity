class Developer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  include DeviseTokenAuth::Concerns::User
  include User

  belongs_to :organization
  has_one :profile, as: :viewable
  has_many :courses, dependent: :nullify
end
