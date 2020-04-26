Rails.application.routes.draw do
  devise_for :users
  get "restaurants/search" => "restaurants#search"
  post "restaurants/split/:id" => "restaurants#split", as: "restaurants_split"
  post "restaurants/nosplit/:id" => "restaurants#nosplit", as: "restaurants_nosplit"
  post "restaurants/:id/comment" => "restaurants#add_comment", as: "restaurants_add_comment"
  post "restaurants/:id/favorite" => "restaurants#add_favorite", as: "restaurants_add_favorite"
  resources :restaurants
  get "restaurants/:id/comment/new" => "restaurants#new_comment", as: "restaurants_new_comment"
  get "users/:id" => "users#show", as: "users_show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

