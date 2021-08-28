class UsersController < ApplicationController
  skip_before_action :authorize, only: [:create, :show]

  # GET /users
  # def index
  #   @users = User.all

  #   render json: @users
  # end

  # POST /users
  def create
    user = User.create!(user_params)
        session[:user_id] = user.id
        render json: { user: user }, status: :created
  end
  
  # GET /users/1
  def show
    user = User.find_by(id: session[:user_id])
    if user
      render json: { user: user}, status: :ok
    else
      render json: { errors: ["Not authorized"] }, status: :unauthorized
    end
  end
  
  
  # PATCH/PUT /users/1
  # def update
  #   if @user.update(user_params)
  #     render json: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = User.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :password, :password_confirmation)
    end
end
