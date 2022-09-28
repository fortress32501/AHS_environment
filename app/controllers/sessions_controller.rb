class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :new]
  
  def new
  end

  def create
    session_params = params.permit(:email, :password)
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      # if email and password matches, redirect to homepage
      redirect_to :root
    else
      flash[:notice] = "Login failed! Please check your email or password."
      redirect_to new_session_path
    end
  end

  def delete
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been signed out!"
    redirect_to new_session_path
  end
end
