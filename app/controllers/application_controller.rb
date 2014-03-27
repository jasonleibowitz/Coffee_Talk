class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      return nil
    end
  end

  helper_method :authenticate
  def authenticate
    if current_user == nil
      redirect_to root_path
    elsif current_user.admin
      return true
    elsif
      flash[:notice] = "You do not have sufficient privledges to access that page."
      redirect_to root_path
    end
  end

end
