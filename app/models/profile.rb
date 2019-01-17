class Profile < ApplicationRecord
	belongs_to :viewable, polymorphic: true

	validates :name, presence: true, length: { maximum: 100 }
	validates :bio, length: { maximum: 1000 }
	validates :github_username, presence: true
end
