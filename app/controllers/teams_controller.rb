# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :check_status, only: %i[index]
  before_action :set_team, only: %i[show update destroy]

  # GET /teams
  def index status = "active"
    if @status.empty?
      # @teams = Team.order("#{@order_by} #{@order}")
      @teams = Team.includes(:captain, :vice_captain).order("#{@order_by} #{@order}")
    else
      @teams = Team.includes(:captain, :vice_captain).where(status: @status).order("#{@order_by} #{@order}")
    end
    render json: @teams
  end

  # GET /teams/1
  def show
    render json: @team
  end

  # POST /teams
  def create
    @team = Team.new(team_params)

    if @team.save
      render json: @team, status: :created, location: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  def check_status
    @status = params[:status] ? params[:status] : ''
  end

  # Only allow a list of trusted parameters through.
  def team_params
    params.require(:team).permit(:name, :status, :state, :city, :location, :contact, :captain_id, :vice_captain_id)
  end
end
