require 'test_helper'

class Api::V1::ExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! get_hostname
  end

  test "get exercises index" do
    get api_v1_course_lesson_exercises_url(course_id: 1, lesson_id: 1)
    assert_response :success
  end

  test "get individual exercise" do
    exercise = exercises(:one)

    get api_v1_course_lesson_exercise_url(course_id: exercise.lesson.course_id, lesson_id: exercise.lesson_id, id: exercise.id)
    assert_response :success
  end

  test "missing record error" do
    missing_course = Course.maximum(:id) + 1
    missing_lesson = Lesson.maximum(:id) + 1
    missing_exercise = Exercise.maximum(:id) + 1

    # Requesting an exercise from a missing course produces a 404
    get api_v1_course_lesson_exercise_url(course_id: missing_course, lesson_id: 1, id: 1)
    assert_response 404

    # Requesting an exercise from a missing lesson produces a 404
    get api_v1_course_lesson_exercise_url(course_id: 1, lesson_id: missing_lesson, id: 1)
    assert_response 404

    # Requesting an exercise from a missing exercise produces a 404
    get api_v1_course_lesson_exercise_url(course_id: 1, lesson_id: 1, id: missing_exercise)
    assert_response 404
  end

  test "push exercise" do
    post api_v1_course_lesson_exercises_push_url(course_id: 1, lesson_id: 1)
    assert_response :success
    skip
  end
end
