class AdminRequestsController < ApplicationController
  before_action :set_admin_request, only: %i[ show edit review approve deny update destroy ]

  # GET /admin_requests or /admin_requests.json
  def index
    @admin_requests = AdminRequest.all
  end

  # GET /admin_requests/1 or /admin_requests/1.json
  def show
    # this is the review page for admin requests
    # => should only be viewed by admins
    if (!current_user.is_admin) 
        redirect_to admin_requests_path
    end
  end

  # GET /admin_requests/new
  def new
    # only users should be able to generate admin requests
    if (current_user.is_admin) 
        redirect_to admin_requests_path
    end

    @admin_request = AdminRequest.new
  end

  # GET /admin_requests/1/edit
  def edit
    # should only be able to edit request if they made it
    if (current_user.id != @admin_request.user_id) 
        redirect_to admin_requests_path
    end
  end

  # GET /admin_requests/1/approve
  def approve
    # only admins should be able to approve/view a request
    # request must also be in the "REQUESTED" state to be approved
    if (!current_user.is_admin || @admin_request.request_status != "REQUESTED") 
        redirect_to admin_requests_path
    end

    @admin_request.approve
    redirect_to admin_requests_path
  end

  # GET /admin_requests/1/deny
  def deny
    # only admins should be able to deny/view a request
    # request must also be in the "REQUESTED" state to be denied
    if (!current_user.is_admin || @admin_request.request_status != "REQUESTED") 
        redirect_to admin_requests_path
    end

    @admin_request.deny
    redirect_to admin_requests_path
  end

  # POST /admin_requests or /admin_requests.json
  def create
    # admins should not be able to create a request
    if (current_user.is_admin) 
        redirect_to admin_requests_path
    end

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
    # should only be able to edit request if they made it
    if (current_user.id != @admin_request.user_id) 
        redirect_to admin_requests_path
    end

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
    # no one should be able to destroy a request
    redirect_to admin_requests_path

    # @admin_request.destroy

    # respond_to do |format|
    #   format.html { redirect_to admin_requests_url, notice: "Admin request was successfully destroyed." }
    #   format.json { head :no_content }
    # end
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
