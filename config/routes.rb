Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    sessions: 'auth/sessions'
  }

  resources :users
  resources :dialy_sales
end
