class ApplicationController < ActionController::Base
  include Subdomains
  protect_from_forgery with: :exception

  def require_login
    unless user_signed_in?
      redirect_to sign_in_path
    end
  end

  private

  def current_user
    current_student || current_instructor || current_developer || current_admin
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
