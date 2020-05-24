Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/homepage", to: "homepage#index", as: :homepage
  get "/menuitems", to: "menuitems#index", as: :new_menuitems
  post "/menuitems", to: "menuitems#create"
  get "menuitems/:id", to: "menuitems#show"
  get "/menus", to: "menus#index", as: :menus
  get "/" => "home#new", as: :home
  get "/users/new" => "users#new", as: :new_users
  post "/users/new" => "users#create", as: :users
  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  get "/orders", to: "orders#new"
  get "orderitems", to: "orders#new", as: :orderitems

  #get "/menuitems/cart", to: "menuitems#cart", as: :new_cartitems
  post "/menuitems/cart", to: "menuitems#new", as: :cartitems
  delete "/exit" => "menusessions#destroy", as: :destroy_menusession
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/cart" => "orders#new", as: :cart
  delete "/order_items/:id" => "order_items#destroy", as: :order_items
  put "/order_items/update/:id" => "order_items#update", as: :update_order_items
  resources :orders
  resources :menus
  resources :menuitems
  resources :users
end
