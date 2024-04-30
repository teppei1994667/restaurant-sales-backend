class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.find_by(email: request.headers["uid"])
    stores = Store.where(user_id: user.id)
    render json: {"user" => user, "stores" => stores}
  end
end
