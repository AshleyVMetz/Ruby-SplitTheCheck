Rails.application.routes.draw do
  devise_for :users
  get "restaurants/search" => "restaurants#search"
  post "restaurants/split/:id" => "restaurants#split", as: "restaurants_split"
  post "restaurants/nosplit/:id" => "restaurants#nosplit", as: "restaurants_nosplit"
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

