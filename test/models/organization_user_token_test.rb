require 'test_helper'

class OrganizationUserTokenTest < ActiveSupport::TestCase
  test "valid token" do
    student = students(:one)
    organization = organizations(:one)
    token = OrganizationUserToken.new(token: "12344321",
      email: student.email,
      token_type: "student",
      organization: organization)
    assert token.valid?
  end

  test "valid token token" do
    # Token must exist
    no_token = OrganizationUserToken.new(token: nil)
    assert_not no_token.valid?
    assert_not no_token.errors[:token].empty?

    # Token must be unique
    first_token = organization_user_tokens(:one)
    duplicate_token = OrganizationUserToken.new(token: first_token.token)
    assert_not duplicate_token.valid?
    assert_not duplicate_token.errors[:token].empty?

    # Token must be 8 hex digits
    wrong_length_token = OrganizationUserToken.new(token: "123456789")
    assert_not wrong_length_token.valid?
    assert_not wrong_length_token.errors[:token].empty?

    non_hex_token = OrganizationUserToken.new(token: "1234rrty")
    assert_not non_hex_token.valid?
    assert_not non_hex_token.errors[:token].empty?

    # Valid token produces no errors
    valid_token = OrganizationUserToken.new(token: "1234abcd")
    valid_token.valid?
    assert valid_token.errors[:token].empty?
  end

  test "valid token email" do
    # Token email must exist
    no_email = OrganizationUserToken.new(email: nil)
    assert_not no_email.valid?
    assert_not no_email.errors[:email].empty?

    # Token email must match an existing user
    user = students(:one)
    matching_email = OrganizationUserToken.new(email: user.email)
    matching_email.valid?
    assert matching_email.errors[:email].empty?

    non_matching_email = OrganizationUserToken.new(email: "google@google.com")
    assert_not non_matching_email.valid?
    assert_not non_matching_email.errors[:email].empty?
  end

  test "valid token type" do
    # Token type must be one of ["student", "instructor", "developer", "admin"]
    student_token = OrganizationUserToken.new(token_type: "student")
    student_token.valid?
    assert student_token.errors[:token_type].empty?

    instructor_token = OrganizationUserToken.new(token_type: "instructor")
    instructor_token.valid?
    assert instructor_token.errors[:token_type].empty?

    developer_token = OrganizationUserToken.new(token_type: "developer")
    developer_token.valid?
    assert developer_token.errors[:token_type].empty?

    admin_token = OrganizationUserToken.new(token_type: "admin")
    admin_token.valid?
    assert admin_token.errors[:token_type].empty?

    wrong_token_type = OrganizationUserToken.new(token_type: "other")
    assert_not wrong_token_type.valid?
    assert_not wrong_token_type.errors[:token_type].empty?

    # Token type is not case sensitive
    weird_case_token = OrganizationUserToken.new(token_type: "sTuDeNt")
    weird_case_token.valid?
    assert weird_case_token.errors[:token_type].empty?

    # Token type is required
    no_token_type = OrganizationUserToken.new(token_type: nil)
    assert_not no_token_type.valid?
    assert_not no_token_type.errors[:token_type].empty?
  end

  test "token type matches email" do
    # The token type must match the account type of the email
    user = students(:one)
    matching_email = OrganizationUserToken.new(email: user.email, token_type: "instructor")
    assert_not matching_email.valid?
    assert_not matching_email.errors[:token_type].empty?
  end
end
