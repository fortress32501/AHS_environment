class EventTypesController < ApplicationController
  before_action :set_event_type, only: %i[ show edit update destroy ]

  # GET /event_types or /event_types.json
  def index
    @event_types = EventType.all
  end

  # GET /event_types/1 or /event_types/1.json
  def show
  end

  # GET /event_types/new
  def new
    @event_type = EventType.new
    if !current_user.is_admin
      respond_to do |format|
        format.html { redirect_to event_types_url, notice: "You do not have access to new. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      end
    end
  end

  # GET /event_types/1/edit
  def edit
    if !current_user.is_admin
      respond_to do |format|
        format.html { redirect_to event_types_url, notice: "You do not have access to edit. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      end
    end
  end

  # POST /event_types or /event_types.json
  def create
    @event_type = EventType.new(event_type_params)
    
    respond_to do |format|
      if !current_user.is_admin
        format.html { redirect_to event_types_url, notice: "You do not have access to create. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      elsif @event_type.save
        format.html { redirect_to event_type_url(@event_type), notice: "Event type was successfully created." }
        format.json { render :show, status: :created, location: @event_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_type.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /event_types/1 or /event_types/1.json
  def update
    respond_to do |format|
      if !current_user.is_admin
        format.html { redirect_to event_types_url, notice: "You do not have access to update. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      elsif @event_type.update(event_type_params)
        format.html { redirect_to event_type_url(@event_type), notice: "Event type was successfully updated." }
        format.json { render :show, status: :ok, location: @event_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_types/1 or /event_types/1.json
  def destroy
    @event_type.destroy

    respond_to do |format|
      if !current_user.is_admin
        format.html { redirect_to event_types_url, notice: "You do not have access to destroy. You can request Administrator Access through Administrator request page." }
        format.json { head :no_content }
      else
        format.html { redirect_to event_types_url, notice: "Event type was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_type
      @event_type = EventType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_type_params
      params.require(:event_type).permit(:type_name, :description, :color)
    end
end
