class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    json_response(@users)
  end

  # POST /users
def create
  @user = User.create!(user_params)
  json_response(@user, :username)
end

# GET /users/:id
def show
  json_response(@user)
end

# PUT /users/:id
def update
  @user.update(user_params)
  head :no_content
end

# DELETE /users/:id
def destroy
  @user.destroy
  head :no_content
end

private

def user_params
  # whitelist params
  params.permit(:firstname,
                :lastname,
                :username,
                :password,
                :phone,
                :email)
end

def set_user
  @user = User.find(params[:id])
end
end