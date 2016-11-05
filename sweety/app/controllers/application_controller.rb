class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
    if (@user == nil) then
      @user = User.new
    end
    return @user
  end

  def auth_user
    redirect_to '/sessions/new' unless session[:user_id]
  end
end
