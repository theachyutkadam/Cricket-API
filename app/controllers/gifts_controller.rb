# frozen_string_literal: true

class GiftsController < ApplicationController
  before_action :set_gift, only: %i[show update destroy]

  # GET /gifts
  def index
    @gifts = Gift.all

    render json: @gifts
  end

  # GET /gifts/1
  def show
    render json: @gift
  end

  # POST /gifts
  def create
    @gift = Gift.new(gift_params)

    if @gift.save
      render json: @gift, status: :created, location: @gift
    else
      render json: @gift.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gifts/1
  def update
    if @gift.update(gift_params)
      render json: @gift
    else
      render json: @gift.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gifts/1
  def destroy
    @gift.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gift
    @gift = Gift.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gift_params
    params.permit(:inning_id, :reason, :player_id, :match_id, :team_id, :name_of_donner, :amount,
                                 :description)
  end
end
