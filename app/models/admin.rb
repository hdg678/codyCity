class Admin < ApplicationRecord
  belongs_to :organization
  has_one :user, as: :account

end
