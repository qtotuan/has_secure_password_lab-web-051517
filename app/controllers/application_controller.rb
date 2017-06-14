class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?
  helper_method :current_user

  def current_user
    @user = User.find_by(id: session[:user_id]) || User.new
  end

  def hello
    redirect_to login_path unless session[:name]
  end

  private

  def logged_in?
    redirect_to login_path unless current_user
  end
end
