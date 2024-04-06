class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
		@user = User.find_by(email: request.headers["uid"])
    render json: @user
  end

end
