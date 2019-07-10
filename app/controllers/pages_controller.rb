class PagesController < ApplicationController
  def root
    if user_signed_in?
      redirect_to courses_path
    end
  end

  def sign_in
  end

  def sign_up
  end
end
