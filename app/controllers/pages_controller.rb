class PagesController < ApplicationController
  def root
    if @organization
      if user_signed_in?
        redirect_to courses_path
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
