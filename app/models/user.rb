class User < ApplicationRecord
  has_secure_password

  belongs_to :account, polymorphic: true

  def name
    self.first_name + " " + self.last_name
  end
end
