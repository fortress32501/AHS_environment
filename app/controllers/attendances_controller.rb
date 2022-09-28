class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
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
  end

  # POST /attendances or /attendances.json
  def create
    @attendance = Attendance.find(attendance_params[:user_id], attendance_params[:event_id])

    #only run if the attendance value doesn't exist
    if @attendance.nil?
      #Create new attendance
      @attendance = Attendance.new(attendance_params)

      #Find user and event
      @user = User.find(@attendance.user_id)
      @event = Event.find(@attendance.event_id)

      # User point update
      @user.point = @user.point + @event.event_points
      @attendance.points = @event.event_points
      
      
      respond_to do |format|
        if @attendance.save and @user.save
          format.html { redirect_to attendance_url(@attendance), notice: "Attendance was successfully created." }
          format.json { render :show, status: :created, location: @attendance }
          
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @attendance.errors, status: :unprocessable_entity }
        end
      end


    #If attendance already exists goes here 
    else 
      respond_to do |format|
        format.html {redirect_to attendances_path, notice: "Attendance already exists" }
      end
    end
  end

  # PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
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
      format.html { redirect_to attendances_url, notice: "Attendance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:user_id, :event_id, :points)
    end
end
