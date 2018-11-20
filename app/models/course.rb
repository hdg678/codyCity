class Course < ApplicationRecord
  belongs_to :organization
  belongs_to :developer

  has_many :lessons

  validates :title, presence: true
  validates :description, presence: true
end
