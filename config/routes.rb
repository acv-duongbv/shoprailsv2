Rails.application.routes.draw do
  get "/products", to: "products#index"
  get "/products/:slug", to: "products#show", as: "product"
  root to: "products#index"
  devise_for :users, controller: {sessions: "users/sessions"}
end
