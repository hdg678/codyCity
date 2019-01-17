class Organization < ApplicationRecord
  has_many :admins
  has_many :instructors
  has_many :developers
  has_many :students
  has_many :courses

  validates :name, presence: true, length: { maximum: 100 }
end
