class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(Uploader.upload(user_params))

    if @user.save
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

  # REQUEST FRIEND /users/1/request_friend
def friend_request
  @user = current_user
  friend = User.find(params[:friend_id])

  if @user.friend_request(friend)
    render json: friend
  elsif @user.friend_request(friend) == nil
    render json: 'Already friends'
  end
end

# ACCEPT FRIEND /users/1/accept_friend
def accept_request
  @user = current_user
  friend = User.find(params[:friend_id])

  if @user.accept_request(friend)
    render json: friend
  elsif @user.accept_request(friend) == nil
    render json: 'Invalid request'
  end
end

# DECLINE FRIEND /users/1/decline_friend
def decline_request
  @user = current_user
  friend = User.find(params[:friend_id])

  if @user.decline_request(friend)
    render json: @user
  elsif @user.decline_request(friend) == nil
    render json: 'Invalid request'
  end
end

# REMOVE FRIEND /users/1/remove_friend
def remove_friend
  @user = current_user
  friend = User.find(params[:friend_id])

  if @user.remove_friend(friend)
    render json: @user
  elsif @user.remove_friend(friend) == nil
    render json: 'Invalid request'
  end
end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :image, :github_id, :facebook_id, :google_id, :instagram_id, :base64)
    end
end
