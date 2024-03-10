Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: "auth/registrations"
  }

  namespace :auth do
    resource :sessions, only: %i[index]
  end
  resources :users, only: %i[show]
  resources :dialy_sales
end
