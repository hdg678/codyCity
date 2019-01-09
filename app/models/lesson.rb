class Lesson < ApplicationRecord
  belongs_to :course

  has_many :exercises, dependent: :destroy

  validates :title, presence: true
end
