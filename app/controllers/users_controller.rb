class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: %i[ show edit update destroy ]
  # GET /users/1 or /users/1.json
  def show
    set_user
  end
  
  # GET /users or /users.json
  def index
    @users = User.all
  end
  
  # GET /users/new
  def new
    @user = User.new
  end
  

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = "Creation failed, try again"
      redirect_to new_user_path
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :point, :privileges_id)
    end
end
