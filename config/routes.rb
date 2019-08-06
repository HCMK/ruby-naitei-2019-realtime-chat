Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  post "/users/search", to: "users#search"
  resources :rooms, only: [:create, :show]
  resources :invites, only: :create
  resources :join_rooms, only: :create
  root "static_pages#home"
  mount ActionCable.server => '/cable'
end
