Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'posts#index'
  get '/users/:id/change_avatar', to: 'users#change_avatar', as: 'change_avatar'
  post "/friends/add" => "friends/add"
  post "/friends/reject" => "friends/reject"
  post "/friends/remove" => "friends/remove"
  get "/friends/search" => "friends/search"
  post "/friends/search" => "friends/search"
  resources :posts do
    resources :comments, only: :create
  end
  resources :friends, only: [:index, :create]
  resources :users, only: [:show, :edit, :update]
end
