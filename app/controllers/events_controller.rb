class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  # GET /events or /events.json
  def index
    @events = Event.all
    @event_types = EventType.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    if !current_user.is_admin
      respond_to do |format|
        format.html { redirect_to events_url, notice: "You do not have access to new. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      end
    end
  end

  # GET /events/1/edit
  def edit
    if !current_user.is_admin
      respond_to do |format|
        format.html { redirect_to events_url, notice: "You do not have access to edit. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      end
    end
  end

  # POST /events or /events.json
  def create
    @event = Event.create!(params[:event].permit(:event_points, :event_description, :event_passcode, :event_start, :event_end, :event_title, :event_location, :event_type_id))

    respond_to do |format|
      if !current_user.is_admin
        format.html { redirect_to events_url, notice: "You do not have access to create. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      elsif @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if !current_user.is_admin
        format.html { redirect_to event_types_url, notice: "You do not have access to update. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      elsif @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      if !current_user.is_admin
        format.html { redirect_to events_url, notice: "You do not have access to destroy. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      else
        format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:event_points, :event_description, :event_passcode, :event_start, :event_end, :event_title, :event_location, :event_type_id)
    end

  def get_event_type(event)
    temp = EventType.find_by(id: event.event_type_id)
    if temp
      temp.type_name
    else
      "None"
    end
  end

  def get_event_color(event)
    temp = EventType.find_by(id: event.event_type_id)
    if temp
      temp.color + "88"
    else
      "FFFFFF88"
    end
  end

  def dilute_color(color)
    color + "88"
  end

  helper_method :get_event_type
  helper_method :get_event_color
  helper_method :dilute_color
end
