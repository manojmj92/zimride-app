class UserSessionsController < ApplicationController
	before_filter :require_user, :only => :destroy
  skip_before_filter :verify_logged_in, :only => [:new,:create]
  def new
    if current_user.present?
      redirect_back_or_default user_path(current_user)
    end
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default account_path
    else
      flash[:notice] = "Incorrect username/password"
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end
