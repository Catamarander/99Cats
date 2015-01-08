class SessionsController < ApplicationController
  before_action :already_logged_in, only: [:new, :create]

  def already_logged_in
    if current_user
      redirect_to cats_url
    end
  end

  def new
    @user = User.new

    render :new
  end

  def create
    login_user!
  end

  def destroy
    @user = current_user
    session[:session_token] = nil
    @user.reset_session_token!
    render :new
  end
end
