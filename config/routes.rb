Rails.application.routes.draw do
  root to: "products#index"
  get "/products", to: "products#index"
  get "/products/:slug", to: "products#show", as: "product"
  post "/mycart", to: "line_items#create", as: "add_cart"
  get "/mycart", to: "carts#show", as: "cart"
  get "/:slug", to: "categories#show", as: "category"

  devise_for :users, controller: {sessions: "users/sessions"}
end
