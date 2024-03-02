Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registration: "auth/registration"
  }

  namespace :auth do
    resource :sessions, only: %i[index]
  end
  resources :dialy_sales
end
