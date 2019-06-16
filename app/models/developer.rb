class Developer < ApplicationRecord
  belongs_to :organization
  has_one :profile, as: :viewable
  has_many :courses, dependent: :nullify
end
