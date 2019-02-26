class OrganizationUserToken < ApplicationRecord
  belongs_to :organization

  validates :token, presence: true, uniqueness: true, length: { is: 8 }, format: { with: /\A[0-9a-fA-F]{8}\Z/, message: "token must be an 8-digit hex number" }
  validates :token_type, presence: true
  validate :token_type_is_valid_option
  validates :email, presence: true
  validate :email_matches_existing_user
  validate :token_type_matches_account

  def self.generate(organization_id, email, token_type)
    token = SecureRandom.hex(4)
    self.create(organization_id: organization_id, email: email, token_type: token_type, token: token)
    token
  end

  def token_type_is_valid_option
    if token_type != nil
      unless ["student", "instructor", "developer", "admin"].include?(token_type.downcase)
        errors.add(:token_type, "token type must match a valid user type")
        return false
      end
    end
    true
  end

  def email_matches_existing_user
    unless (Student.find_by_email(email) || Instructor.find_by_email(email) || Developer.find_by_email(email) || Admin.find_by_email(email)) != nil
      errors.add(:email, "email must match an existing user")
      return false
    end
    true
  end

  def token_type_matches_account
    if token_type != nil && email != nil && token_type_is_valid_option && email_matches_existing_user
      unless (Student.find_by_email(email) || Instructor.find_by_email(email) || Developer.find_by_email(email) || Admin.find_by_email(email)).class.name.underscore.to_sym == token_type.to_sym
        errors.add(:token_type, "token type must match account type")
      end
    end
  end
end
