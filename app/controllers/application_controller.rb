class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    login_info = Login.find_by(token: session[:session_token])
    login_info.user
    # User.find_by(session_token: session[:session_token])
  end

  def login_user!
    @user = User.find_by_credentials(params[:user][:user_name],
                                     params[:user][:password])
    if @user
      @user.reset_session_token!
      session[:session_token] = @user.session_token
      redirect_to cats_path
    else
      render :new
    end
  end
end
