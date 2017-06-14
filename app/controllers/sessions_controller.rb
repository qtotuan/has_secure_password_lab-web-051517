class SessionsController < ApplicationController

  before_action :logged_in?

  def new
  end

  def create
    # byebug 
    @user = User.find_by_name(params[:user][:name])
    if @user.nil?
      redirect_to new_user_path
    end

    return redirect_to login_path unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id

    redirect_to root_path
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end


end
