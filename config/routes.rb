Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registration: "auth/registration"
  }
  resources :dialy_sales
end
