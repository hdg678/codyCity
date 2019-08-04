class User < ApplicationRecord
  belongs_to :account, polymorphic: true

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :password, confirmation: true, length: { minimum: 8 }

  def name
    self.first_name + " " + self.last_name
  end
end
