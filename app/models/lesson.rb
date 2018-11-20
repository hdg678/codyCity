class Lesson < ApplicationRecord
  belongs_to :course

  has_many :exercises

  validates :title, presence: true
end
