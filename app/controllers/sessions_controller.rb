class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    redirect_to root_path if logged_in?
  end

  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user
      if @user.authenticate(params[:session][:password])
        log_in @user
        flash[:success] = 'Successfully logged in.'
        redirect_to ideas_path
      else
        flash.now[:danger] = 'Wrong password provided.'
        render 'new'
      end
    else
      flash.now[:danger] = 'Provided e-mail does not exist.'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = 'Successfully logged out.' unless logged_in?
    redirect_to root_url
  end
end
