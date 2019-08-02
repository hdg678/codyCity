class Developer < ApplicationRecord
  belongs_to :organization
  has_one :profile, as: :viewable
  has_one :user, as: :account

  has_and_belongs_to_many :courses
end
