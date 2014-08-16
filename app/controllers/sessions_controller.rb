class SessionsController < ApplicationController

  def create
    session[:password] = params[:password]
    flash[:notice] = "Successfully logged in"
    if admin?
      redirect_to root_url
      return
    elsif manager?
      redirect_to "/mis/#{params[:password]}"
      return
    end
    redirect_to new_session_url
  end
  
  def destroy
    reset_session
    flash[:notice] = "Successfully logged out"
    redirect_to root_url
  end
end