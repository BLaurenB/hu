class SessionsController < ApplicationController


  def create
    user = Authentication.from_omniauth(request.env["omniauth.auth"]).user
    # binding.pry
    session[:user_id] = user.id
    redirect_to dashboard_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end


end
