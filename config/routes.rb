Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/menuitems", to: "menuitems#index", as: :new_menuitems
  post "menuitems/create", to: "menuitems#create"
  get "menuitems/:id", to: "menuitems#show"
  get "menus", to: "menus#index"
  get "/" => "home#new", as: :home
  get "/users/new" => "users#new", as: :new_users
  post "/users/new" => "users#create", as: :users
  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  post "/menu_items", to: "menu_items#create", as: :menu_items
  get "/menu_items/new", to: "menu_items#new", as: :new_menu_items
  resources :menus
  resources :menuitems
end
