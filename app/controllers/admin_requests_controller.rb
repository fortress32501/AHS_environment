class AdminRequestsController < ApplicationController
  before_action :set_admin_request, only: %i[ show edit update destroy ]

  # GET /admin_requests or /admin_requests.json
  def index
    @admin_requests = AdminRequest.all
  end

  # GET /admin_requests/1 or /admin_requests/1.json
  def show
  end

  # GET /admin_requests/new
  def new
    @admin_request = AdminRequest.new
  end

  # GET /admin_requests/1/edit
  def edit
  end

  # POST /admin_requests or /admin_requests.json
  def create
    @admin_request = AdminRequest.new(admin_request_params)

    respond_to do |format|
      if @admin_request.save
        format.html { redirect_to admin_request_url(@admin_request), notice: "Admin request was successfully created." }
        format.json { render :show, status: :created, location: @admin_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_requests/1 or /admin_requests/1.json
  def update
    respond_to do |format|
      if @admin_request.update(admin_request_params)
        format.html { redirect_to admin_request_url(@admin_request), notice: "Admin request was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_requests/1 or /admin_requests/1.json
  def destroy
    @admin_request.destroy

    respond_to do |format|
      format.html { redirect_to admin_requests_url, notice: "Admin request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_request
      @admin_request = AdminRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_request_params
      params.require(:admin_request).permit(:user_id, :request_status, :request_reason)
    end
end
