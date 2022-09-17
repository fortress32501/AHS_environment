class SessionsController < ApplicationController
  def new
  end

  def create
    @users = Users.find_by(username: params[:username])
    # authenthication
    if !!@users && @users.authenthicate(params[:password])
      # set session
      session[:users_id] = @users.id
      # redirect to home
      redirect_to users_path
    else
      # show error message if the login fails
      message = "Invalid username or password, please try again"
      redirect_to login_path, notice: message
    end
  end

  def destroy
  end
end
