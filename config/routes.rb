Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "menuitems", to: "menuitems#index"
  get "menuitems/create", to: "menuitems#create"
  get "menuitems/:id", to: "menuitems#show"
  get "/" => "home#index"
  resources :menus
  resources :menuitems
end
