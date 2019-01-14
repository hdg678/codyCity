module User
  extend ActiveSupport::Concern

  included do
    validate :email_must_be_unique_across_account_types, on: :create
  end

  def email_must_be_unique_across_account_types
    unless (Student.find_by_email(email) || Instructor.find_by_email(email) || Developer.find_by_email(email) || Admin.find_by_email(email)) == nil
      errors.add(:email, "email must be unique")
    end
  end
end
