Rails.application.routes.draw do
  get "/products", to: "products#index"
  root to: "products#index"
  devise_for :users, controller: {sessions: "users/sessions"}
end
