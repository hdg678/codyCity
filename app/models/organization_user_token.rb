class OrganizationUserToken < ApplicationRecord
  belongs_to :organization

  def self.generate(organization_id, email, token_type)
    token = SecureRandom.hex(4)
    self.create(organization_id: organization_id, email: email, token_type: token_type, token: token)
    token
  end
end
