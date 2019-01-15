module User
  extend ActiveSupport::Concern

  included do
    validate :email_must_be_unique_across_account_types, on: :create

    before_validation do
      self.uid ||= email
    end

    validates :first_name, presence: true, length: { maximum: 30 }
    validates :last_name, presence: true, length: { maximum: 30 }
    validates :email, presence: true, format: Devise.email_regexp, uniqueness: true
    validates :password, presence: true, confirmation: true, length: { minimum: 10 }, on: :create
    validates :password_confirmation, presence: true, on: :create
  end

  def email_must_be_unique_across_account_types
    unless (Student.find_by_email(email) || Instructor.find_by_email(email) || Developer.find_by_email(email) || Admin.find_by_email(email)) == nil
      errors.add(:email, "email must be unique")
    end
  end
end
