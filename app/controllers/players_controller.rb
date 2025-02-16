# frozen_string_literal: true

class PlayersController < ApplicationController
  before_action :check_speciality, only: %i[index]
  before_action :set_player, only: %i[show update destroy]

  # GET /players
  def index speciality = "batsman"
    if @speciality.empty?
      # @players = Player.includes(:user).order("#{@order_by} #{@order}")
      @players = Player.order("#{@order_by} #{@order}")
    else
      # @players = Player.includes(:user).where(speciality: @speciality).order("#{@order_by} #{@order}")
      @players = Player.where(speciality: @speciality).order("#{@order_by} #{@order}")
    end
    render json: @players
  end
  # def index
  #   @players = Player.includes(:user)

  #   render json: @players
  # end

  # GET /players/1
  def show
    render json: @player
  end

  # POST /players
  def create
    @player = Player.new(player_params)
    if @player.save
      render json: @player, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_player
    @player = Player.find(params[:id])
  end

  def check_speciality
    @speciality = params[:speciality] ? params[:speciality] : ''
  end

  # Only allow a list of trusted parameters through.
  def player_params
    params.require(:player).permit(:first_name, :middle_name, :last_name, :contact, :gender, :birth_date,
                                   :speciality, :user_id)
  end
end
