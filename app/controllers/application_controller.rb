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
    #current_student || current_instructor || current_developer || current_admin
    return nil
  end

  def user_signed_in?
    current_user != nil
  end

  def student_signed_in?
    current_student != nil
  end

  def instructor_signed_in?
    current_instructor != nil
  end

  def developer_signed_in?
    current_developer != nil
  end

  def admin_signed_in?
    current_admin != nil
  end
end
