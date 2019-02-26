require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test "valid profile" do
    viewable = students(:one)
    profile = Profile.new(name: "Bob Dole",
      bio: "I was a senator",
      github_username: "bobdole",
      viewable: viewable)
    assert profile.valid?
  end

  test "valid profile name" do
    # Name is required
    no_name = Profile.new(name: nil)
    assert_not no_name.valid?
    assert_not no_name.errors[:name].empty?

    # Length (<= 100)
    long_name = Profile.new(name: "a" * 101)
    assert_not long_name.valid?
    assert_not long_name.errors[:name].empty?

    # Valid name no errors
    valid_name = Profile.new(name: "Adam Smith")
    valid_name.valid?
    assert valid_name.errors[:name].empty?
  end

  test "valid profile bio" do
    # Bio is not required
    no_bio = Profile.new(bio: nil)
    no_bio.valid?
    assert no_bio.errors[:bio].empty?

    # Length (<= 1000)
    long_bio = Profile.new(bio: "a" * 1001)
    assert_not long_bio.valid?
    assert_not long_bio.errors[:bio].empty?

    # Valid bio
    valid_bio = Profile.new(bio: "this is a valid bio.")
    valid_bio.valid?
    assert valid_bio.errors[:bio].empty?
  end

  test "valid github username" do
    # Github username is required
    no_username = Profile.new(github_username: nil)
    assert_not no_username.valid?
    assert_not no_username.errors[:github_username].empty?

    # Valid username
    valid_username = Profile.new(github_username: "githubusername")
    valid_username.valid?
    assert valid_username.errors[:github_username].empty?
  end
end
