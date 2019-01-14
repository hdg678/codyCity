require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  test "valid developer" do
    organization = organizations(:one)
    developer = Developer.new(email: "testdeveloper@test.com",
      organization: organization,
      first_name: "Ted",
      last_name: "Larson")
    assert developer.valid?
  end

  test "valid email" do
    # Email must exist
    no_email = Developer.new(email: "")
    assert_not no_email.valid?
    assert_not no_email.errors[:email].empty?

    # Email must be a valid email
    invalid_email = Developer.new(email: "thisisntanemail")
    assert_not invalid_email.valid?
    assert_not invalid_email.errors[:email].empty?

    # A valid email doesn't produce an email error
    valid_email = Developer.new(email: "validemail@test.com")
    valid_email.valid?
    assert valid_email.errors[:email].empty?
  end

  test "valid organization" do
    # Organization must exist
    no_organization = Developer.new(organization: nil)
    assert_not no_organization.valid?
    assert_not no_organization.errors[:organization].empty?

    # A valid organization produces no errors
    organization = organizations(:one)
    valid_organization = Developer.new(organization: organization)
    valid_organization.valid?
    assert valid_organization.errors[:organization].empty?
  end

  test "uid not required with email" do
    # UID doesn't raise errors if email is provided
    no_uid = Developer.new(uid: nil, email: "uidtester@test.com")
    assert no_uid.errors[:uid].empty?
  end

  test "valid first name" do
    # First name must exist
    no_first_name = Developer.new(first_name: nil)
    assert_not no_first_name.valid?
    assert_not no_first_name.errors[:first_name].empty?

    # First name must be shorter than 31 characters
    long_first_name = Developer.new(first_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    assert_not long_first_name.valid?
    assert_not long_first_name.errors[:first_name].empty?

    # A valid first name produces no errors
    valid_first_name = Developer.new(first_name: "First Name")
    valid_first_name.valid?
    assert valid_first_name.errors[:first_name].empty?
  end

  test "valid last name" do
    # Last name must exist
    no_last_name = Developer.new(last_name: nil)
    assert_not no_last_name.valid?
    assert_not no_last_name.errors[:last_name].empty?

    # Last name must be shorter than 31 characters
    long_last_name = Developer.new(last_name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    assert_not long_last_name.valid?
    assert_not long_last_name.errors[:last_name].empty?

    # A valid last name produces no errors
    valid_last_name = Developer.new(last_name: "Last Name")
    valid_last_name.valid?
    assert valid_last_name.errors[:last_name].empty?
  end

  test "valid token" do
    skip

    # Token must exist
    no_token = Developer.new(token: nil)
    assert_not no_token.valid?
    assert_not no_token.errors[:token].empty?

    # Token must match organization
    org = organizations(:one)
    token_org = OrganizationUserType.generate(2, "tokenorg@test.com", "developer")
    different_org = Developer.new(email: "tokenorg@test.com", organization: org, token: token_org)
    assert_not different_org.valid?
    assert_not different_org.errors[:token].empty?

    # Token must match email
    token_email = OrganizationUserToken.generate(1, "tokentester@test.com", "developer")
    different_email = Developer.new(email: "shouldfail@test.com", organization: org, token: token_email)
    assert_not different_email.valid?
    assert_not different_email.errors[:token].empty?

    # Token must match user type
    token_inst = OrganizationUserToken.generate(1, "tokentesterinstructor@test.com", "instructor")
    different_type = Developer.new(email: "tokentesterinstructor@test.com", organization: org, token: token_inst)
    assert_not different_type.valid?
    assert_not different_type.errors[:token].empty?

    # A matching token produces no error
    correct_token = OrganizationUserToken.generate(1, "success@test.com", "developer")
    correct = Developer.new(email: "success@test.com", organization: org, token: correct_token)
    correct.valid?
    assert_not correct.errors[:token].empty?
  end

  test "unique email" do
    # Unique email with respect to same account type
    organization = organizations(:one)
    first = Developer.new(email: "first@test.com",
      organization: organization,
      first_name: "Adam",
      last_name: "Smith")
    first.save

    dup = Developer.new(email: "first@test.com",
      organization: organization,
      first_name: "Bob",
      last_name: "Latta")
    assert_not dup.valid?

    # Unique email with respect to other account types
    second_dup = Developer.new(email: "instructorone@test.com",
      organization: organization,
      first_name: "Marcy",
      last_name: "Kaptor")
    assert_not second_dup.valid?
  end
end
