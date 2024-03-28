class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { message: 'hello' }
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
