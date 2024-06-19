Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth", controllers: {
    registrations: "auth/registrations",
    sessions: "auth/sessions"
  }

  resources :users
  resources :stores
  resources :dialy_sales
  get "/dialy_sales_comparison/:id", to: "dialy_sales#comparison"
end
