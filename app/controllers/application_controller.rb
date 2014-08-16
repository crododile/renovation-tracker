class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def admin?
    session[:password] == "covenant"
  end
  
  def manager?
    Property.find_by_property session[:password]
  end

  def require_admin
    redirect_to new_session_url unless admin?
  end
  
  def validate_manager
    unless params[:property] == session[:password]
      redirect_to new_session_url
    end
  end
  
  
end
