class Organization < ApplicationRecord
  has_many :admins
  has_many :instructors
  has_many :developers
  has_many :students

  has_many :courses

  def count_users
    admins.count + instructors.count + developers.count + students.count
  end

  validates :name, presence: true
end
