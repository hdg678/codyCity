class PagesController < ApplicationController
  def root
    if @organization
      if user_signed_in?
        case current_user.account
        when Student
          render "pages/root_student"
        when Instructor
          render "pages/root_instructor"
        when Developer
          render "pages/root_developer"
        when Admin
          render "pages/root_admin"
        end
      else
        redirect_to sign_in_path
      end
    end
  end

  def sign_in
  end

  def sign_up
  end
end
