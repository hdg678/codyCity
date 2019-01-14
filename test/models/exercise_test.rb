require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  setup do
    @exercise = exercises(:one)
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
