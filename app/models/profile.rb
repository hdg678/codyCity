class Profile < ApplicationRecord
	belongs_to :viewable, polymorphic: true
end
