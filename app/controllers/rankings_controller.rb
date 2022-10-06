class RankingsController < ApplicationController
  before_action :set_ranking, only: %i[ show edit update destroy ]

  # GET /rankings or /rankings.json
  def index
    @rankings = Ranking.all
    # SELECT first_name, email,point FROM Users ORDER BY point desc;
    # @list_rankings = User.select(:first_name, :last_name, :email, :point).order(point: :desc).limit(10)
    # @list_rankings = User.select(:first_name, :last_name, :email, :point).order(point: :desc)
      # SELECT 
      # 1+(SELECT count(*) 
      # from (select point from Users GROUP BY point) as A 
      # WHERE A.point > B.point) as RNK,
      # first_name, email, point FROM Users as B ORDER BY point desc;
      query = <<-SQL 
      SELECT 
      1+(SELECT count(*) 
      from (select point from Users GROUP BY point) as A 
      WHERE A.point > B.point) as rnk,
      first_name, last_name, email, point FROM Users as B ORDER BY point desc
    SQL
    
    @list_rankings = ActiveRecord::Base.connection.execute(query)
  end

  # GET /rankings/1 or /rankings/1.json
  def show
  end

  # GET /rankings/new
  def new
    @ranking = Ranking.new
  end

  # GET /rankings/1/edit
  def edit
  end

  # POST /rankings or /rankings.json
  def create
    @ranking = Ranking.new(ranking_params)

    respond_to do |format|
      if @ranking.save
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
      if @ranking.update(ranking_params)
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
      format.html { redirect_to rankings_url, notice: "Ranking was successfully destroyed." }
      format.json { head :no_content }
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
