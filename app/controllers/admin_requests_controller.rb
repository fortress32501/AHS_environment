class AdminRequestsController < ApplicationController
  before_action :set_admin_request, only: %i[ show edit review approve deny update destroy ]
  before_action :has_admin_request, only: %i[ index new create ]

  # GET /admin_requests or /admin_requests.json
  def index
    @admin_requests = AdminRequest.all
  end

  # GET /admin_requests/1 or /admin_requests/1.json
  def show
    # this is the review page for admin requests
    # => should only be viewed by admins
    if (!current_user.is_admin) 
        respond_to do |format|
            format.html { redirect_to admin_requests_path, notice: "You do not have access to review requests." }
            format.json { head :no_content }
        end

        return
    end
  end

  # GET /admin_requests/new
  def new
    # only users should be able to generate admin requests
    if (current_user.is_admin) 
        respond_to do |format|
            format.html { redirect_to admin_requests_path, notice: "You do not have access to create requests. You are already an admin." }
            format.json { head :no_content }
        end

        return
    end

    # each user can only create 1 admin request
    if (@has_request)
        respond_to do |format|
            format.html { redirect_to admin_requests_path, notice: "You do not have access to create requests. You can only have one in progress at a time." }
            format.json { head :no_content }
        end

        return
    end

    @admin_request = AdminRequest.new
  end

  # GET /admin_requests/1/edit
  def edit
    # should only be able to edit request if they made it
    if (current_user.id != @admin_request.user_id) 
        respond_to do |format|
            format.html { redirect_to admin_requests_path, notice: "You can only edit your requests." }
            format.json { head :no_content }
        end

        return
    end

    # should only be able to edit requests that are in the REQUESTED state
    if (@admin_request.request_status != "REQUESTED")
        respond_to do |format|
            format.html { redirect_to admin_requests_path, notice: "You can only edit requests that are currently REQUESTED." }
            format.json { head :no_content }
        end

        return
    end
  end

  # GET /admin_requests/1/approve
  def approve
    # only admins should be able to approve/view a request
    if (!current_user.is_admin) 
        respond_to do |format|
            format.html { redirect_to admin_requests_path, notice: "You do not have access to approve requests. You are not an admin." }
            format.json { head :no_content }
        end

        return
    end

    # request must also be in the "REQUESTED" state to be approved
    if (@admin_request.request_status != "REQUESTED")
        respond_to do |format|
            format.html { redirect_to admin_requests_path, notice: "You do not have access to approve that request. It has already been processed." }
            format.json { head :no_content }
        end

        return
    end

    @admin_request.approve
    respond_to do |format|
        format.html { redirect_to admin_requests_path, notice: "The request has been approved." }
        format.json { head :no_content }
    end
  end

  # GET /admin_requests/1/deny
  def deny
    # only admins should be able to deny/view a request
    if (!current_user.is_admin) 
        respond_to do |format|
            format.html { redirect_to admin_requests_path, notice: "You do not have access to deny requests. You are not an admin." }
            format.json { head :no_content }
        end

        return
    end

    # request must also be in the "REQUESTED" state to be denied
    if (@admin_request.request_status != "REQUESTED")
        respond_to do |format|
            format.html { redirect_to admin_requests_path, notice: "You do not have access to deny that request. It has already been processed." }
            format.json { head :no_content }
        end

        return
    end

    @admin_request.deny
    respond_to do |format|
        format.html { redirect_to admin_requests_path, notice: "The request has been denied." }
        format.json { head :no_content }
    end
  end

  # POST /admin_requests or /admin_requests.json
  def create
    # admins should not be able to create a request
    if (current_user.is_admin) 
        respond_to do |format|
            format.html { redirect_to admin_requests_path, notice: "You do not have access to create requests. You are already an admin." }
            format.json { head :no_content }
        end

        return
    end

    # each user can only create 1 admin request
    if (@has_request)
        respond_to do |format|
            format.html { redirect_to admin_requests_path, notice: "You do not have access to create more requests. You are currently have a request in progress." }
            format.json { head :no_content }
        end

        return
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
        respond_to do |format|
            format.html { redirect_to admin_requests_path, notice: "You do not have access to edit this request." }
            format.json { head :no_content }
        end

        return
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
    respond_to do |format|
        format.html { redirect_to admin_requests_path, notice: "You do not have access to delete requests." }
        format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_request
      @admin_request = AdminRequest.find(params[:id])
    end

    def has_admin_request
      # the current user has a request IF 1) a request matches their user id AND 2) is in the REQUESTED state
      @has_request = AdminRequest.all.select{ 
        |req| 
          req.user_id == current_user.id &&
          req.request_status == "REQUESTED"
      }.length() > 0 ? true : false
    end

    # Only allow a list of trusted parameters through.
    def admin_request_params
      params.require(:admin_request).permit(:user_id, :request_status, :request_reason)
    end
end
