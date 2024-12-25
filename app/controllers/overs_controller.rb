# frozen_string_literal: true

class OversController < ApplicationController
  before_action :set_over, only: %i[show update destroy]

  # GET /overs
  def index
    @overs = Over.all

    render json: @overs
  end

  # GET /overs/1
  def show
    render json: @over
  end

  # POST /overs
  def create
    @over = Over.new(over_params)

    if @over.save
      render json: @over, status: :created, location: @over
    else
      render json: @over.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /overs/1
  def update
    if @over.update(over_params)
      render json: @over
    else
      render json: @over.errors, status: :unprocessable_entity
    end
  end

  # DELETE /overs/1
  def destroy
    @over.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_over
    @over = Over.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def over_params
    params.require(:over).permit(:real_ball_number, :run_type, :ball_status, :wicket_type, :strick_batsman_id,
                                 :non_strick_batsman_id, :bowler_id, :bowled_in_over, :total_runs, :over_number, :inning_id)
  end
end
