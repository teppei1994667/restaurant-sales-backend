class Auth::SessionsController < DeviseTokenAuth::SessionsController
  wrap_parameters false

  def index
    if current_user
      render json: { is_login: trun, data: current_user }
    else
      render json: { is_login: false, message: 'ユーザーが存在しません' }
    end
  end

  def destroy
    # 認証情報を含むヘッダーからトークン情報を取得
    client_id = request.headers['client']
    uid = request.headers['uid']
    access_token = request.headers['access-token']

    # トークン情報を使用してユーザーを特定し、トークンを無効化する
    user = User.find_by(uid: uid)
    user&.tokens&.delete(client_id)

    if user&.save
      render json: { message: 'ログアウトしました。' }
    else
      render json: { errors: ['ログアウトに失敗しました。'] }, status: :unprocessable_entity
    end
  end

  private

  def sign_in_params
    params.require(:session).permit(:email, :password)
  end
end
