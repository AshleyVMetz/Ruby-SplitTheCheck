Rails.application.routes.draw do
  get "restaurants/search" => "restaurants#search"
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

