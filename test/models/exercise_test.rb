require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  setup do
    @exercise = exercises(:one)
  end

  test "valid exercise" do
    lesson = lessons(:one)
    exercise = Exercise.new(title: "title",
      instructions: "instructions",
      point_value: 1.0,
      test_file_url: "http://google.com",
      public_test_file_url: "http://bing.com",
      exercise_file_url: "http://yahoo.com",
      lesson: lesson)
    assert exercise.valid?
  end

  test "valid title" do
    # Title must exist
    no_title = Exercise.new(title: nil)
    assert_not no_title.valid?
    assert_not no_title.errors[:title].empty?

    # Title must be shorter than 200 characters
    long_title = Exercise.new(title: "123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890")
    assert_not long_title.valid?
    assert_not long_title.errors[:title].empty?

    # A valid title produces no errors
    valid_title = Exercise.new(title: "This is a valid title.")
    valid_title.valid?
    assert valid_title.errors[:title].empty?
  end

  test "valid instructions" do
    # Instructions must exist
    no_instructions = Exercise.new(instructions: nil)
    assert_not no_instructions.valid?
    assert_not no_instructions.errors[:instructions].empty?

    # Instructions must be shorter than 2000 characters
    long_instructions = Exercise.new(instructions: "a" * 2001)
    assert_not long_instructions.valid?
    assert_not long_instructions.errors[:instructions].empty?

    # Valid instructions produce no errors
    valid_instructions = Exercise.new(instructions: "some very insightful instructions")
    valid_instructions.valid?
    assert valid_instructions.errors[:instructions].empty?
  end

  test "valid point value" do
    skip
  end

  test "valid test file url" do
    # Test File URL must exist
    no_test_file_url = Exercise.new(test_file_url: nil)
    assert_not no_test_file_url.valid?
    assert_not no_test_file_url.errors[:test_file_url].empty?

    # Test File URL must be a valid URL

    # A valid test file URL produces no errors
    valid_test_file_url = Exercise.new(test_file_url: "http://test.com")
    valid_test_file_url.valid?
    assert valid_test_file_url.errors[:test_file_url].empty?
  end

  test "valid public test file url" do
    # Public Test File URL must exist
    no_public_test_file_url = Exercise.new(public_test_file_url: nil)
    assert_not no_public_test_file_url.valid?
    assert_not no_public_test_file_url.errors[:public_test_file_url].empty?

    # Public Test File URL must be a valid URL

    # A valid public test file URL produces no errors
    valid_public_test_file_url = Exercise.new(public_test_file_url: "http://test.com")
    valid_public_test_file_url.valid?
    assert valid_public_test_file_url.errors[:public_test_file_url].empty?
  end

  test "valid exercise file url" do
    # Exercise File URL must exist
    no_exercise_file_url = Exercise.new(exercise_file_url: nil)
    assert_not no_exercise_file_url.valid?
    assert_not no_exercise_file_url.errors[:exercise_file_url].empty?

    # Exercise File URL must be a valid URL

    # A valid exercise file URL produces no errors
    valid_exercise_file_url = Exercise.new(exercise_file_url: "http://test.com")
    valid_exercise_file_url.valid?
    assert valid_exercise_file_url.errors[:exercise_file_url].empty?
  end

  test "pass valid response" do
    skip
    response = file_fixture("correct_response.rb").read
    assert @exercise.check_response?(response)
  end

  test "fail invalid response" do
    skip
    response = file_fixture("incorrect_response.rb").read
    assert_not @exercise.check_response?(response)
  end
end
