class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
    if !current_user.is_admin
      respond_to do |format|
        format.html { redirect_to events_url, notice: "You do not have access to see attendances. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      end
    end
  end

  # GET /attendances/1 or /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
    if !current_user.is_admin
      respond_to do |format|
        format.html { redirect_to events_url, notice: "You do not have access to edit this attendance. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      end
    end
  end

  # POST /attendances or /attendances.json
  def create
    @attendance = Attendance.find_by(user_id: attendance_params[:user_id], event_id: attendance_params[:event_id])
    @user = User.find_by(id: attendance_params[:user_id])
    @event = Event.find_by(id: attendance_params[:event_id])
    #only run if the attendance value doesn't exist
    if (@attendance.nil? and !(@user.nil? or @event.nil?))
      #Create new attendance
      @attendance = Attendance.new(attendance_params)
      
      # User point update
      @user.point = @user.point + @event.event_points
      @attendance.points = @event.event_points
      
      respond_to do |format|
        if (@event.event_passcode == attendance_params[:password])
          if @attendance.save and @user.save
            format.html { redirect_to attendance_url(@attendance), notice: "Attendance was successfully created." }
            format.json { render :show, status: :created, location: @attendance }
          
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @attendance.errors, status: :unprocessable_entity }
          end
        else 
          format.html { redirect_to new_attendance_path(eventID: @event.id), notice: 'Password Incorrect' }
        end
      end

      #If attendance already exists goes here 
    else 
      respond_to do |format|
        format.html {redirect_to events_path, notice: "Your attendance has already been taken" }

      end
    end
  end

  # PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    respond_to do |format|
      if !current_user.is_admin
        format.html { redirect_to events_url, notice: "You do not have access to update this attendance. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      elsif @attendance.update(attendance_params)
        format.html { redirect_to attendance_url(@attendance), notice: "Attendance was successfully updated." }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1 or /attendances/1.json
  def destroy
    @attendance.destroy
    
    respond_to do |format|
      if !current_user.is_admin
        format.html { redirect_to events_url, notice: "You do not have access to destroy. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      else
        format.html { redirect_to attendances_url, notice: "Attendance was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:user_id, :event_id, :points, :password)
    end
end
