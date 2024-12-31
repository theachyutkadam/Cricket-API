# frozen_string_literal: true

class MatchesController < ApplicationController
  before_action :check_status, only: %i[index]
  before_action :set_match, only: %i[show update destroy]

  # GET /matches
  def index status = "upcomming"
    if @status.empty?
      @matches = Match.order("#{@order_by} #{@order}")
    else
      @matches = Match.where(status: @status).order("#{@order_by} #{@order}")
    end
    render json: @matches
  end

  # GET /matches/1
  def show
    render json: @match
  end

  # POST /matches
  def create
    @match = Match.new(match_params)

    if @match.save
      render json: @match, status: :created, location: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /matches/1
  def update
    if @match.update(match_params)
      render json: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # DELETE /matches/1
  def destroy
    @match.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_match
    @match = Match.find(params[:id])
  end

  def check_status
    @status = params[:status] ? params[:status] : ''
  end

  # Only allow a list of trusted parameters through.
  def match_params
    params.require(:match).permit(:team1_id, :team2_id, :number_of_overs, :winner_team_id, :is_draw, :start_at,
                                  :end_at, :toss_winer_team_id, :won_by_wicket, :won_by_runs, :match_draw_reason, :toss_dicision)
  end
end
