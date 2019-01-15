require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  test "valid lesson" do
    course = courses(:one)
    lesson = Lesson.new(title: "title",
      course: course)
    assert lesson.valid?
  end

  test "valid title" do
    # Title must exist
    no_title = Lesson.new(title: nil)
    assert_not no_title.valid?
    assert_not no_title.errors[:title].empty?

    # Title must be shorter than 200 characters
    long_title = Lesson.new(title: "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890")
    assert_not long_title.valid?
    assert_not long_title.errors[:title].empty?

    # A valid title produces no errors
    valid_title = Lesson.new(title: "This is a valid title.")
    valid_title.valid?
    assert valid_title.errors[:title].empty?
  end

  test "valid order value" do
    skip
  end
end
