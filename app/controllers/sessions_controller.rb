class SessionsController < ApplicationController
  def newS
  end

  def create
    session[:password] = params[:password]
    flash[:notice] = "Successfully logged in"
    redirect_to root_url
  end
  
  def destroy
    reset_session
    flash[:notice] = "Successfully logged out"
    redirect_to root_url
  end
end