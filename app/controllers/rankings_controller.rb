class RankingsController < ApplicationController
  before_action :set_ranking, only: %i[ show edit update destroy ]

  # GET /rankings or /rankings.json
  def index
    @rankings = Ranking.all
    
    @list_rankings = Ranking.get_ranking_list
    if !current_user.is_admin   
      redirect_to events_url, notice: "You do not have access to view rankings. You can request Administrator Access through Administrator request page."
    end
  end

  # GET /rankings/1 or /rankings/1.json
  def show
    if !current_user.is_admin
      redirect_to events_url, notice: "You do not have access to show rankings. You can request Administrator Access through Administrator request page."
    end
  end

  # GET /rankings/new
  def new
    @ranking = Ranking.new
    if !current_user.is_admin
      redirect_to events_url, notice: "You do not have access to create rankings. You can request Administrator Access through Administrator request page."
    end
  end

  # GET /rankings/1/edit
  def edit
    if !current_user.is_admin
      redirect_to events_url, notice: "You do not have access to edit rankings. You can request Administrator Access through Administrator request page."
    end
  end

  # POST /rankings or /rankings.json
  def create
    @ranking = Ranking.new(ranking_params)

    respond_to do |format|
      if !current_user.is_admin
        redirect_to evens_url, notice: "You do not have access to create rankings. You can request Administrator Access through Administrator request page."        
      elsif @ranking.save
        format.html { redirect_to ranking_url(@ranking), notice: "Ranking was successfully created." }
        format.json { render :show, status: :created, location: @ranking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rankings/1 or /rankings/1.json
  def update
    respond_to do |format|
      if !current_user.is_admin
        redirect_to events_url, notice: "You do not have access to update rankings. You can request Administrator Access through Administrator request page."
      elsif @ranking.update(ranking_params)
        format.html { redirect_to ranking_url(@ranking), notice: "Ranking was successfully updated." }
        format.json { render :show, status: :ok, location: @ranking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rankings/1 or /rankings/1.json
  def destroy
    @ranking.destroy

    respond_to do |format|
      if !current_user.is_admin
        redirect_to events_url, notice: "You do not have access to destroy rankings. You can request Administrator Access through Administrator request page."
      else
        format.html { redirect_to rankings_url, notice: "Ranking was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ranking
      @ranking = Ranking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ranking_params
      params.require(:ranking).permit(:title, :point_total)
    end
end
