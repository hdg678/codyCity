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

    # Wrong password returns unauthorized
    post api_v1_student_session_url, params: { email: student.email, password: "wrongpassword" }
    assert_response 401

    # Sign in produces a valid token
    post api_v1_student_session_url, params: { email: student.email, password: "securepassword" }
    token = @response.headers["access-token"]
    client = @response.headers["client"]
    uid = @response.headers["uid"]

    assert token != nil
    assert client != nil
    assert uid != nil

    # Valid token
    get api_v1_students_validate_token_url, params: { "access-token": token, client: client, uid: uid }
    assert_response :success
  end

  test "sign in instructor" do
    # Hitting sign in with no parameters produces a 401 Unauthorized
    post api_v1_instructor_session_url
    assert_response 401

    # Hitting sign in with a correct email and password produces success
    instructor = instructors(:one)
    post api_v1_instructor_session_url, params: { email: instructor.email, password: "securepassword" }
    assert_response :success

    # Wrong password returns unauthorized
    post api_v1_instructor_session_url, params: { email: instructor.email, password: "wrongpassword" }
    assert_response 401

    # Sign in produces a valid token
    post api_v1_instructor_session_url, params: { email: instructor.email, password: "securepassword" }
    token = @response.headers["access-token"]
    client = @response.headers["client"]
    uid = @response.headers["uid"]

    assert token != nil
    assert client != nil
    assert uid != nil

    # Valid token
    get api_v1_instructors_validate_token_url, params: { "access-token": token, client: client, uid: uid }
    assert_response :success
  end

  test "sign in developer" do
    # Hitting sign in with no parameters produces a 401 Unauthorized
    post api_v1_developer_session_url
    assert_response 401

    # Hitting sign in with a correct email and password produces success
    developer = developers(:one)
    post api_v1_developer_session_url, params: { email: developer.email, password: "securepassword" }
    assert_response :success

    # Wrong password returns unauthorized
    post api_v1_developer_session_url, params: { email: developer.email, password: "wrongpassword" }
    assert_response 401

    # Sign in produces a valid token
    post api_v1_developer_session_url, params: { email: developer.email, password: "securepassword" }
    token = @response.headers["access-token"]
    client = @response.headers["client"]
    uid = @response.headers["uid"]

    assert token != nil
    assert client != nil
    assert uid != nil

    # Valid token
    get api_v1_developers_validate_token_url, params: { "access-token": token, client: client, uid: uid }
    assert_response :success
  end

  test "sign in admin" do
    # Hitting sign in with no parameters produces a 401 Unauthorized
    post api_v1_admin_session_url
    assert_response 401

    # Hitting sign in with a correct email and password produces success
    admin = admins(:one)
    post api_v1_admin_session_url, params: { email: admin.email, password: "securepassword" }
    assert_response :success

    # Wrong password returns unauthorized
    post api_v1_admin_session_url, params: { email: admin.email, password: "wrongpassword" }
    assert_response 401

    # Sign in produces a valid token
    post api_v1_admin_session_url, params: { email: admin.email, password: "securepassword" }
    token = @response.headers["access-token"]
    client = @response.headers["client"]
    uid = @response.headers["uid"]

    assert token != nil
    assert client != nil
    assert uid != nil

    # Valid token
    get api_v1_admins_validate_token_url, params: { "access-token": token, client: client, uid: uid }
    assert_response :success
  end
end
