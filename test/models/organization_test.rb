require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test "valid organization" do
    organization = Organization.new(name: "Harvard")
    assert organization.valid?
  end

  test "valid name" do
    # Name must be present
    no_name = Organization.new(name: nil)
    assert_not no_name.valid?
    assert_not no_name.errors[:name].empty?

    # Name must be 100 characters or shorter
    long_name = Organization.new(name: "f" * 101)
    assert_not long_name.valid?
    assert_not long_name.errors[:name].empty?

    # Valid name produces no errors
    valid_name = Organization.new(name: "MIT")
    valid_name.valid?
    assert valid_name.errors[:name].empty?
  end
end
