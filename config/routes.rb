Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/homepage", to: "homepage#index", as: :homepage
  get "/menuitems", to: "menuitems#index", as: :new_menuitems
  post "/menuitems", to: "menuitems#create"
  get "menuitems/:id", to: "menuitems#show"
  get "/orders/new" => "orders#new", as: :carts
  post "/orders/confirm" => "orders#confirm"
  post "/deliverorder/:id" => "orders#deliverOrder"
  #get "/menus", to: "menus#index", as: :menus
  get "/" => "home#new", as: :home
  get "/users/new" => "users#new", as: :new_users
  post "/users/new" => "users#create", as: :users
  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  get "/orders", to: "orders#index"

  #get "/menuitems/cart", to: "menuitems#cart", as: :new_cartitems
  #post "/menuitems/cart", to: "menuitems#new", as: :cartitems
  delete "/exit" => "menusessions#destroy", as: :destroy_menusession
  delete "/signout" => "sessions#destroy", as: :destroy_session
  #post "/orderitems" => "orderitems#create"
  post "/cart/:id" => "order_items#cart", as: :cart
  get "/orders/:id" => "orders#show", as: :order
  delete "/order_items/:id" => "order_items#destroy"
  get "/order_items/:id" => "order_items#change"

  resources :orders
  resources :menus
  resources :menuitems
  resources :users
  resources :order_items
end
