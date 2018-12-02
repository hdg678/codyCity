class Developer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable#,
         #jwt_authenticatable, jwt_revocation_strategy: JWTBlacklist


  belongs_to :organization
  has_one :profile, as: :viewable
end
