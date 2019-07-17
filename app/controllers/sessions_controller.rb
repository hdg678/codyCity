class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:instructor][:email])
    if user && user.authenticate(params[:instructor][:password])
      session[:user_id] = user.id
      render 'pages/root'
    else
      render 'pages/sign_in'
    end
  end

  def destroy
    session[:user_id] = nil
  end
end
