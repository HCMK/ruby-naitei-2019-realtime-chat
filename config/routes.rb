Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  post "/users/search", to: "users#search"
  resources :rooms, only: [:create, :show, :destroy]
  resources :admins, only: [:create, :destroy]
  resources :invites, only: :create
  resources :join_rooms, only: :create
  delete "join_rooms/:id/:user_id", to: "join_rooms#destroy",
                          as: "join_room_destroy"
  resources :messages, only: :create
  root "static_pages#home"
  mount ActionCable.server => '/cable'
end
