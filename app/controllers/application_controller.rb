class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  wrap_parameters false

  # 用途不明のため調査
  skip_before_action :verify_authenticity_token
  helper_method :current_user, :user_signed_in?
end
