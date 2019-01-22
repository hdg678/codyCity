require 'test_helper'

class Api::V1::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! get_hostname
  end

  test "sign in student" do
    # Hitting sign in with no parameters produces a 401 Unauthorized
    post api_v1_student_session_url

    assert_response 401

    # Hitting sign in with a correct email and password produces success
    student = students(:one)

    post api_v1_student_session_url, params: { email: student.email, password: "securepassword" }


    assert_response :success
  end

  test "sign in instructor" do
    # Hitting sign in with no parameters produces a 401 Unauthorized
    post api_v1_instructor_session_url

    assert_response 401

    instructor = instructors(:one)

    # Hitting sign in with a correct email and password produces success
    post api_v1_instructor_session_url, params: { email: instructor.email, password: "securepassword" }

    assert_response :success
  end

  test "sign in developer" do
    # Hitting sign in with no parameters produces a 401 Unauthorized
    post api_v1_developer_session_url

    assert_response 401

    developer = developers(:one)

    # Hitting sign in with a correct email and password produces success
    post api_v1_developer_session_url, params: { email: developer.email, password: "securepassword" }

    assert_response :success
  end

  test "sign in admin" do
    # Hitting sign in with no parameters produces a 401 Unauthorized
    post api_v1_admin_session_url

    assert_response 401

    admin = admins(:one)
    admin.confirm

    # Hitting sign in with a correct email and password produces success
    post api_v1_admin_session_url, params: { email: admin.email, password: "securepassword" }

    assert_response :success
  end
end
