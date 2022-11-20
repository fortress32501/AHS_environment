# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[create new]
  layout 'screen_size', only: :new

  def new; end

  # https://medium.com/@rmeji1/creating-a-login-with-simple-auth-using-ruby-on-rails-7dd95a03cb7a
  # Unpermitted parameters: :authenticity_token, :commit
  def create
    session_params = params.permit(:email, :password, :authenticity_token, :commit)
    @user = User.find_by(email: session_params[:email].downcase)
    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      # if email and password matches, redirect to homepage
      redirect_to :root
    else
      flash[:notice] = 'Login failed! Please check your email or password.'
      redirect_to new_session_path
    end
  end

  def delete; end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have been signed out!'
    redirect_to new_session_path
  end
end
