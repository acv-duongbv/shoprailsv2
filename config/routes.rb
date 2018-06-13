Rails.application.routes.draw do
  root to: "products#index"
  get "/products", to: "products#index"
  get "/products/:slug", to: "products#show", as: "product"
  post "/mycart", to: "line_items#create", as: "add_cart"
  get "/mycart", to: "carts#show", as: "cart"
  delete "/line_items/:id", to: "line_items#destroy", as: "line"
  patch "/line_items", to: "line_items#update", as: "update_line"
  # get 'orders', to: 'order'
  get "/:slug", to: "categories#show", as: "category"

  devise_for :users, controller: {sessions: "users/sessions"}
end
