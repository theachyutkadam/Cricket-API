# frozen_string_literal: true

class InningsController < ApplicationController
  before_action :set_inning, only: %i[show update destroy]

  # GET /innings
  def index
    @innings = Inning.all

    render json: @innings
  end

  # GET /innings/1
  def show
    render json: @inning
  end

  # POST /innings
  def create
    @inning = Inning.new(inning_params)

    if @inning.save
      render json: @inning, status: :created, location: @inning
    else
      render json: @inning.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /innings/1
  def update
    if @inning.update(inning_params)
      render json: @inning
    else
      render json: @inning.errors, status: :unprocessable_entity
    end
  end

  # DELETE /innings/1
  def destroy
    @inning.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inning
    @inning = Inning.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inning_params
    params.require(:inning).permit(:match_id, :inning_type, :bat_team_id, :total_runs, :number_of_wickets, :start_at,
                                   :end_at, :target_to_opposition, :is_draw, :draw_reason, :first_umpire_id, :second_umpire_id)
  end
end
