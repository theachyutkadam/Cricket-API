class ManOfTheMatchesController < ApplicationController
  before_action :set_man_of_the_match, only: %i[ show update destroy ]

  # GET /man_of_the_matches
  def index
    @man_of_the_matches = ManOfTheMatch.all

    render json: @man_of_the_matches
  end

  # GET /man_of_the_matches/1
  def show
    render json: @man_of_the_match
  end

  # POST /man_of_the_matches
  def create
    @man_of_the_match = ManOfTheMatch.new(man_of_the_match_params)

    if @man_of_the_match.save
      render json: @man_of_the_match, status: :created, location: @man_of_the_match
    else
      render json: @man_of_the_match.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /man_of_the_matches/1
  def update
    if @man_of_the_match.update(man_of_the_match_params)
      render json: @man_of_the_match
    else
      render json: @man_of_the_match.errors, status: :unprocessable_entity
    end
  end

  # DELETE /man_of_the_matches/1
  def destroy
    @man_of_the_match.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_man_of_the_match
      @man_of_the_match = ManOfTheMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def man_of_the_match_params
      params.require(:man_of_the_match).permit(:inning_id, :reason, :player_id, :match_id, :team_id)
    end
end
