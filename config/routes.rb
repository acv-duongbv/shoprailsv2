Rails.application.routes.draw do
  root to: "products#index"

  get "/products", to: "products#index"
  get "/products/:slug", to: "products#show", as: "product"

  post "/mycart", to: "line_items#create", as: "add_cart"
  get "/mycart", to: "carts#show", as: "cart"

  delete "/line_items/:id", to: "line_items#destroy", as: "line"
  patch "/line_items", to: "line_items#update", as: "update_line"

  get "/orders/new", to: "orders#new", as: "new_order"
  post "/orders", to: "orders#create", as: "orders"
  get "/order/:order_no", to: "orders#show", as: "show_order"
  post "/hook" => "orders#hook"

  get "category/:slug", to: "categories#show", as: "category"

  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                       passwords: "users/passwords",
                     }
end
