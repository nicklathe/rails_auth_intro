class PasswordsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:user][:email])

    if @user
      @user.set_password_reset
      UserMailer.password_reset(@user).deliver
    end

    flash[:warning] = "Password Reset Sent"
    redirect_to login_path
  end

  def edit
    if Time.now < expires_at
    end
  end
end