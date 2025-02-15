# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user!, except: [:health]

  def current_user
    @login_user
  end

  def current_player
    @login_user.player
  end

  def health
    records = ApplicationRecord.record_count
    active_users = User.players.active.first(10).pluck(:email)
    render json: { message: "Good Helth", count: records, active_users: }
  end

  def pagination(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.prev_page, # use object.previous_page when using will_paginate
      total_pages: object.total_pages,
      total_count: object.total_count,
    }
  end

  private

  def authenticate_user!
    order_by
    # if request.headers["authorization"]
    #   return render json: { errors: "Invalid token" }, status: :unauthorized unless find_user

    #   @login_user
    # else
    #   render json: { message: "No authorization Header sent" }, status: :forbidden
    # end
  end

  def find_user
    @login_user = User.find_by(token: request.headers["authorization"])
  end

  def order_by
    @order_by = params[:order_by] ? params[:order_by] : 'id'
    @order = params[:order] ?  params[:order] : 'asc'
  end
end
