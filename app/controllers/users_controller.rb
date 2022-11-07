class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: %i[ show edit update destroy ]
  layout 'login_signup', only: :new
  
  # GET /users/1 or /users/1.json
  def show
    current_user.assign_ranking
  end
  
  # GET /users or /users.json
  def index
    
    if current_user.is_admin
      @users = User.all.order('point DESC')
      current_user.assign_ranking
    elsif
      @users = User.where(id: current_user.id)
      current_user.assign_ranking
    end
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  

  # GET /users/1/edit
  def edit
    if !current_user.is_admin
      redirect_to users_path, notice: "You do not have access to edit other users. You can request Administrator Access through Administrator request page."
    end
  end

  def profile
  end

  # POST /users or /users.json
  def create
    @user = User.find_by(email: user_params[:email])
    if @user.nil?
      @user = User.create(user_params)
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to :root
      else
        flash[:error] = "Creation failed, try again"
        redirect_to new_user_path
      end
    else 
        format.html {redirect_to new_session_path, notice: "User with that Email already exists"}
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_profile
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to accounts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    if current_user.id == @user.id
      @user.destroy
      session[:user_id] = nil
      flash[:notice] = "Your account was successfullly deleted."
      redirect_to new_session_path
    elsif current_user.is_admin
      @user.destroy
      flash[:notice] = "Account was successfullly deleted."
      redirect_to users_path
    else 
      redirect_to events_path, notice: "You do not have access to destroy other users. You can request Administrator Access through Administrator request page."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :point, :is_admin, :ranking_id)
    end
end
