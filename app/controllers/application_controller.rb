class ApplicationController < ActionController::Base
  include Subdomains
  protect_from_forgery with: :exception

  helper_method :current_student
  helper_method :current_instructor
  helper_method :current_developer
  helper_method :current_admin

  helper_method :student_signed_in?
  helper_method :instructor_signed_in?
  helper_method :developer_signed_in?
  helper_method :admin_signed_in?

  def require_login
    unless user_signed_in?
      redirect_to sign_in_path
    end
  end

  def current_student
    return nil
  end

  def current_instructor
    return nil
  end

  def current_developer
    return nil
  end

  def current_admin
    return nil
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def user_signed_in?
    current_user != nil
  end

  def student_signed_in?
    if current_user
      return current_user.account.is_a? Student
    else
      return nil
    end
  end

  def instructor_signed_in?
    if current_user
      return current_user.account.is_a? Instructor
    else
      return nil
    end
  end

  def developer_signed_in?
    if current_user
      return current_user.account.is_a? Developer
    else
      return nil
    end
  end

  def admin_signed_in?
    if current_user
      return current_user.account.is_a? Admin
    else
      return nil
    end
  end
end
