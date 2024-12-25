# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[login create]
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.last(10)

    render json: @users.as_json()
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.set_token

    if @user.save
      puts "record created"
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end


  def login
    @user = User.find_by(email: params[:email])

    return render json: { errors: "User does not found", status: 400 } unless @user
    return render json: { errors: "User has been #{@user.status}", status: 400 } unless @user.active?

    if @user.password == params[:password]
      # return render json: { user_information_id: @user.user_information.id, auth_token: @user.token, status: 200 } if @user.token
      token = @user.generate_token
      @user.update(token:)
      render json: {
        auth_token: token,
        user_details: {
          user_id: @user.id,
          email: @user.email,
          full_name: @user.player ? @user.player.full_name : ''
        },
        status: 200,
      }
    else
      render json: { errors: "Invalid credentials", status: 400 }
    end
  end

  def logout
    user = User.find(current_user.id)
    user.update(token: "")
    if user.token.empty?
      render json: { auth_token: nil, status: 200 }
    else
      render json: { errors: "Something went wrong" }, status: :unauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:password, :email, :status, :token, :role_id)
  end
end
