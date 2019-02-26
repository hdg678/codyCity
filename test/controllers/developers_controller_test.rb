require 'test_helper'

class DevelopersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @developer = developers(:one)
    @token = organization_user_tokens(:developer_one)
    host! get_hostname
  end

  test "should get index" do
    get developers_url
    assert_response :success
  end

  test "should get new" do
    get new_developer_url
    assert_response :success
  end

  test "should create developer" do
    assert_difference('Developer.count') do
      post developers_url, params: { developer: { email: "developer3@test.com", first_name: @developer.first_name, github_password: @developer.github_password, github_username: @developer.github_username, is_teacher: @developer.is_teacher, last_name: @developer.last_name, password: "@developer.password", password_confirmation: "@developer.password" }, token: @token.token }
    end

    assert_redirected_to developer_url(Developer.last)
  end

  test "should show developer" do
    get developer_url(@developer)
    assert_response :success
  end

  test "should get edit" do
    get edit_developer_url(@developer)
    assert_response :success
  end

  test "should update developer" do
    patch developer_url(@developer), params: { developer: { email: @developer.email, first_name: @developer.first_name, github_password: @developer.github_password, github_username: @developer.github_username, is_teacher: @developer.is_teacher, last_name: @developer.last_name, password: @developer.password } }
    assert_redirected_to developer_url(@developer)
  end

  test "should destroy developer" do
    assert_difference('Developer.count', -1) do
      delete developer_url(@developer)
    end

    assert_redirected_to developers_url
  end
end
