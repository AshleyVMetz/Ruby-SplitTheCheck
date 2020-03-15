Rails.application.routes.draw do
  get "restaurants/search" => "restaurants#search"
  post "restaurants/split/:id" => "restaurants#split"
  post "restaurants/nosplit/:id" => "restaurants#nosplit"
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

