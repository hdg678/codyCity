require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "valid course" do
    organization = organizations(:one)
    developer = developers(:one)
    course = Course.new(title: "Title",
      description: "Description",
      image_url: "http://test.com/img.jpeg",
      developer: developer,
      organization: organization)
    assert course.valid?
  end

  test "valid title" do
    # Title must exist
    no_title = Course.new(title: nil)
    assert_not no_title.valid?
    assert_not no_title.errors[:title].empty?

    # Title must be shorter than 200 characters
    long_title = Course.new(title: "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890")
    assert_not long_title.valid?
    assert_not long_title.errors[:title].empty?

    # A valid title produces no errors
    valid_title = Course.new(title: "This is a valid title.")
    valid_title.valid?
    assert valid_title.errors[:title].empty?
  end

  test "valid description" do
    # Description must exist
    no_description = Course.new(description: nil)
    assert_not no_description.valid?
    assert_not no_description.errors[:description].empty?

    # Description must be shorter than 2000
    long_description = Course.new(description: "A" * 2001)
    assert_not long_description.valid?
    assert_not long_description.errors[:description].empty?

    # A valid description produces no errors
    valid_description = Course.new(description: "This is a valid description. This test should pass.")
    valid_description.valid?
    assert valid_description.errors[:description].empty?
  end

  test "valid image" do
    skip
  end
end
