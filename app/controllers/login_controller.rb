class LoginController < ApplicationController
  def index
    @user = current_user
    @logins = Login.find_all_logins_for_user(@user)

    render :index
  end

  def destroy
    time = params[:login][:creation_time]

    @user = current_user
    userid = @user.id
    Login.where(user_id: userid, updated_at: time).destroy_all

    render :index
  end
end
